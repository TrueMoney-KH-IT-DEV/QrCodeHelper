//
//  ViewController.swift
//  QrCodeHelper
//
//  Created by samrith.yoeun@gmail.com on 07/06/2020.
//  Copyright (c) 2020 samrith.yoeun@gmail.com. All rights reserved.
//

import UIKit
import QrCodeHelper

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(frame: CGRect(x: 50, y: 50, width: 250, height: 250))
        self.view.addSubview(imageView)
        
        let content = "this is testing"
        imageView.setQrCode(embededContent: content,
                            options: [.embeddedLogo("logo", size: CGSize(width: 80, height: 80)),
                                      .invertColor,
                                      .tintColor(color: .red)])

       
        let scanner = QrCodeScanner()
        let data = scanner.scanQr(from: UIImage(named: "qrimage"))
        if !data.isEmpty {
            let label = UILabel(frame: CGRect(x: 50, y: 400, width: 500, height: 20))
            label.text = "Data from qr code : " + data
            view.addSubview(label)
        }
        
    }

}

