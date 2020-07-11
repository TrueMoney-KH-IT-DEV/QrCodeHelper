# QrCodeHelper
[![Version](https://img.shields.io/cocoapods/v/QrCodeHelper.svg?style=flat)](https://cocoapods.org/pods/QrCodeHelper)
[![License](https://img.shields.io/cocoapods/l/QrCodeHelper.svg?style=flat)](https://cocoapods.org/pods/QrCodeHelper)
[![Platform](https://img.shields.io/cocoapods/p/QrCodeHelper.svg?style=flat)](https://cocoapods.org/pods/QrCodeHelper)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Installation

QrCodeHelper is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'QrCodeHelper'
```

## Features

QrCodeHelper can help you to generate the QrCode with multiple options: 
- embeded image in the center 
- invert the qr to have the transparent background effect 
- apply the custom tint color to the QrCode 

![image](https://flic.kr/p/2jkedaQ)

## Usage 
QrCodeHelper was created as part of UIImageView extension, all you need to do is call setQrCode funtions and give the appropriate param 

```ruby
imageView.setQrCode(embededContent: content)
```
you can of course add the desired options including .embeddedLogo, .invertedColor and .tintColor
```ruby
imageView.setQrCode(embededContent: content,
                    options: [.embeddedLogo("logo", size: CGSize(width: 80, height: 80)),
                              .tintColor(color: .red)]
```


## Author

samrith.yoeun@gmail.com, sam.yoeun@pathmazing.com

## License

QrCodeHelper is available under the MIT license. See the LICENSE file for more info.

