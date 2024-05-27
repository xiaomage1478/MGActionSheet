![]([https://user-images.githubusercontent.com/19670000/114378430-45129480-9bba-11eb-9051-74d89c3e15f3.png](https://github.com/xiaomage1478/MGActionSheet/blob/main/cover.png))
# XMGActionSheet

[![CI Status](https://img.shields.io/travis/小马哥/MGActionSheet.svg?style=flat)](https://travis-ci.org/小马哥/MGActionSheet)
[![Version](https://img.shields.io/cocoapods/v/MGActionSheet.svg?style=flat)](https://cocoapods.org/pods/MGActionSheet)
[![License](https://img.shields.io/cocoapods/l/MGActionSheet.svg?style=flat)](https://cocoapods.org/pods/MGActionSheet)
[![Platform](https://img.shields.io/cocoapods/p/MGActionSheet.svg?style=flat)](https://cocoapods.org/pods/MGActionSheet)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

MGActionSheet is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'XMGActionSheet'
```
## Usage

import XMGActionSheet

```swift
import XMGActionSheet
```
WeChat Delete Style
```swift

MGActionSheetBuilder.show(title: "是否删除该条消息？", destructiveTitle: "确定") { _ in
    print("删除了～")
}

extension MGActionSheetBuilder {
    public static func show(title: String, destructiveTitle: String, destructiveHandle: ((MGAction) -> Void)?) {
        let titleColor = #colorLiteral(red: 0.370662272, green: 0.3664324582, blue: 0.3663428426, alpha: 1)
        let titleConfig = MGActionConfig(titleColor: titleColor, titleFont: .systemFont(ofSize: 12))
        
        let destructiveColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        let destructiveConfig = MGActionConfig(titleColor: destructiveColor, titleFont: .systemFont(ofSize: 16))
        
        let cancelColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        let cancelConfig = MGActionConfig(titleColor: cancelColor, titleFont: .systemFont(ofSize: 16))
        
        MGActionSheetBuilder()
            .addAction(title: title, style: .default, config: titleConfig, isEnable: false)
            .addAction(title: destructiveTitle, style: .destructive, config: destructiveConfig, handler: destructiveHandle)
            .addCancleAction(config: cancelConfig)
            .build()
    }
}

```
Normal Style

```swift

    MGActionSheetBuilder()
        .addAction(title: "退出网页版文件传输助手？", style: .default, isEnable: false)
        .addAction(title: "退出", style: .destructive)
        .addCancleAction()
        .build()

```

Subtitle Style

```swift

    MGActionSheetBuilder()
        .addAction(title: "拍摄", subtitle: "照片或视频", style: .default)
        .addAction(title: "从手机相册选择", style: .default)
        .addCancleAction()
        .build()

```

Custom Action Height

1. `isAutoHeight = false` is fixed height for action

```swift

    MGActionSheetBuilder()
        .addAction(title: "退出网页版文件传输助手？", style: .default, config: MGActionConfig(titleFont: .systemFont(ofSize: 16, weight: .medium),isAutoHeight: false, actionHeight: 80), isEnable: false)
        .addAction(title: "退出", style: .destructive)
        .addCancleAction()
        .build()

```


2. `isAutoHeight = true` and set `actionMinHeight` is auto height for action

```swift

    MGActionSheetBuilder()
        .addAction(title: "退出网页版文件传输助手？", style: .default, config: MGActionConfig(titleFont: .systemFont(ofSize: 16, weight: .medium),isAutoHeight: true, actionMinHeight: 80), isEnable: false)
        .addAction(title: "退出", style: .destructive)
        .addCancleAction()
        .build()

```

## Author

小马哥, 354938940@qq.com

## License

MGActionSheet is available under the MIT license. See the LICENSE file for more info.
