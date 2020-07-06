#
# Be sure to run `pod lib lint QrCodeHelper.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'QrCodeHelper'
  s.version          = '0.1.0'
  s.summary          = 'a library to generate / scan Qr code content'
  

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
QrCodeHelper can
- generate qr code and set it to UIImageView
- the generated qr code can have the options to embedded a logo in the center, invert color, and change the color
- detect the qr code from ui image
                       DESC

  s.homepage         = 'https://github.com/samrithyoeun/QrCodeHelper.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'samrith.yoeun@gmail.com' => 'samrith.yoeun@gmail.com'}
  s.source           = { :git => 'https://github.com/samrithyoeun/QrCodeHelper.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'QrCodeHelper/Classes/**/*'
  s.swift_versions = '4.0'
  
  # s.resource_bundles = {
  #   'QrCodeHelper' => ['QrCodeHelper/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
