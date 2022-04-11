//
//  QrCodeHelper.swift
//  ios-scanqr-image
//
//  Created by Samrith Yoeun on 7/6/20.
//  Copyright © 2020 Sammi Yoeun. All rights reserved.
//


import UIKit
import AVFoundation

public class QrCodeScanner {
    public init() {}
    public func scanQr(from image: UIImage?) -> String {

        guard let image = image else { return "" }

        guard let ciImage: CIImage = CIImage(image: image) else {
            return ""
        }
        
        let detector = CIDetector(ofType: CIDetectorTypeQRCode, context: nil, options: [CIDetectorAccuracy: CIDetectorAccuracyLow])!

        var qrCodeLink = ""
        
        let features = detector.features(in: ciImage)
        for feature in features as! [CIQRCodeFeature] {
            qrCodeLink += feature.messageString!
        }
        
        return qrCodeLink
    }
}

public enum QrCodeOption {
    case tintColor(color: UIColor)
    case invertColor
    case embeddedLogo(_ logoName: String, size: CGSize = CGSize(width: 60, height: 60))
}

public extension UIImageView {
    
    func setImage(ciImage: CIImage?) {
        if let ciImage = ciImage {
            self.image = UIImage(ciImage: ciImage)
        }
    }
    
    /// place the imageView inside a container view
    /// - parameter superView: the containerView that you want to place the Image inside
    /// - parameter size: size of embbed image, if you opt to not give the value, it will take default value of width 50 height 50
    func addToCenter(of superView: UIView, size: CGSize = CGSize(width: 50, height: 50)) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = .scaleAspectFit
        superView.addSubview(self)

        let centerXConst = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: superView, attribute: .centerX, multiplier: 1, constant: 0)
        let width = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: size.width)
        let height = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: size.height)
        let centerYConst = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: superView, attribute: .centerY, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([width, height, centerXConst, centerYConst])
    }
    
    /// generated a new QR Code with the content of String that were passed into the param
    /// - parameter content: String that will be embedded into QR Code
    func generateQrCode(_ content: String)  -> CIImage? {
        let data = content.data(using: String.Encoding.utf8, allowLossyConversion: false)
        
        let filter = CIFilter(name: "CIQRCodeGenerator")
        
        filter?.setValue(data, forKey: "inputMessage")
        filter?.setValue("H", forKey: "inputCorrectionLevel")
        
        let transform = CGAffineTransform(scaleX: 3, y: 3)
        
        if let output = filter?.outputImage?.transformed(by: transform) {
            return output
        }
        
        return nil
    }
    
    // Invert the colors
    func invertColor(of image: CIImage?) -> CIImage? {
        
        guard let image = image else { return nil}
        guard let colorInvertFilter = CIFilter(name: "CIColorInvert") else { return nil}
        colorInvertFilter.setValue(image, forKey: "inputImage")
        
        guard let outputInvertedImage = colorInvertFilter.outputImage else { return nil}
        
        // Replace the black with transparency
        guard let maskToAlphaFilter = CIFilter(name: "CIMaskToAlpha") else { return nil}
        maskToAlphaFilter.setValue(outputInvertedImage, forKey: "inputImage")
        return maskToAlphaFilter.outputImage
    }
    
    func setTint(_ color: UIColor) {
        let image = self.image
        self.image = image?.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
    }
    
    @discardableResult
    func setQrCode(embededContent: String,
                   options: [QrCodeOption] = []) -> UIImage {
        
        let qrImage = generateQrCode(embededContent)
        self.setImage(ciImage: qrImage)
        
        options.forEach { switch $0 {
        case .embeddedLogo(let logoName, let size):
            let embeddedImageView = UIImageView()
            embeddedImageView.image = UIImage(named: logoName)
            embeddedImageView.addToCenter(of: self, size: size)
            
        case .invertColor:
            self.setImage(ciImage: invertColor(of: qrImage))
            
            
        case .tintColor(let color):
            self.setImage(ciImage: invertColor(of: qrImage))
            self.setTint(color)
            }
        }
        
        guard let ciImage = qrImage else  {
            return UIImage()
        }
        
        return UIImage(ciImage: ciImage)
        
    }

}
