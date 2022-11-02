#
# Be sure to run `pod lib lint SZSafeViewKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SZSafeViewKit'
  s.version          = '0.1.0'
  s.summary          = 'A library with simple UIView wrapper against screenshot and screen record'
  s.swift_version    = '5.0'
  s.description      = <<-DESC
  A library with simple UIView wrapper against screenshot and screen record.
  Specifically, it provides a UITextField wrapper around UIView and the wrapper works like passwork, therefore protecting the view it wrapps.
                          DESC

  s.homepage         = 'https://github.com/Fancy7Fully/SZSafeViewKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Fancy7Fully' => 'zhou.zhiyuan.stephen@hotmail.com' }
  s.source           = { :git => 'https://github.com/Fancy7Fully/SZSafeViewKit.git', :tag => s.version.to_s }
  s.ios.deployment_target = '13.0'

  s.source_files = 'SZSafeViewKit/Classes/**/*'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
