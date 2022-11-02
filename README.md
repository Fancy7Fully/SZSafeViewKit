# SZSafeViewKit

[![CI Status](https://img.shields.io/travis/Fancy7Fully/SZSafeViewKit.svg?style=flat)](https://travis-ci.org/Fancy7Fully/SZSafeViewKit)
[![Version](https://img.shields.io/cocoapods/v/SZSafeViewKit.svg?style=flat)](https://cocoapods.org/pods/SZSafeViewKit)
[![License](https://img.shields.io/cocoapods/l/SZSafeViewKit.svg?style=flat)](https://cocoapods.org/pods/SZSafeViewKit)
[![Platform](https://img.shields.io/cocoapods/p/SZSafeViewKit.svg?style=flat)](https://cocoapods.org/pods/SZSafeViewKit)

  A library with simple UIView wrapper against screenshot and screen record.
  Specifically, it provides a UITextField wrapper around UIView and the wrapper works like password, therefore protecting the view it wrapps.
  
## Example
![alt text](https://github.com/Fancy7Fully/SZSafeViewKit/blob/main/example.png)
To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
Work on iOS 13 and above

## Installation

SZSafeViewKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SZSafeViewKit'
```
And run `pod install` in your repo.

## Use
Simply put the view to protect within the container for usage.
```
let viewToProtect = UIView()
let protectedView = SZSafeViewContainer(content: viewToProtect)
// Then use protectedView
```

## Author

Stephen Zhou, zhou.zhiyuan.stephen@hotmail.com

## License

SZSafeViewKit is available under the MIT license. See the LICENSE file for more info.
