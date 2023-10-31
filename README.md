# GJDynamicHeightCollectionView

[![CI Status](https://img.shields.io/travis/dlrjswns/GJDynamicHeightCollectionView.svg?style=flat)](https://travis-ci.org/dlrjswns/GJDynamicHeightCollectionView)
[![Version](https://img.shields.io/cocoapods/v/GJDynamicHeightCollectionView.svg?style=flat)](https://cocoapods.org/pods/GJDynamicHeightCollectionView)
[![License](https://img.shields.io/cocoapods/l/GJDynamicHeightCollectionView.svg?style=flat)](https://cocoapods.org/pods/GJDynamicHeightCollectionView)
[![Platform](https://img.shields.io/cocoapods/p/GJDynamicHeightCollectionView.svg?style=flat)](https://cocoapods.org/pods/GJDynamicHeightCollectionView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Record Screen 
<img src="https://github.com/dlrjswns/GJDynamicHeightCollectionView/assets/39263235/8662d0fd-ab3b-4ac2-a769-bb1bca9d4012" width=250 />

## Requirements
- iOS 13.0+
- Swift 5.5+
- Xcode 13.0+

## Installation

GJDynamicHeightCollectionView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'GJDynamicHeightCollectionView'
```

## Usage
``` swift
let collectionView = GJDynamicHeightCollectionView()

view.addSubview(collectionView)
collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
```

## License

GJDynamicHeightCollectionView is available under the MIT license. See the LICENSE file for more info.
