//
//  UIColor.swift
//  MGActionSheet
//
//  Created by xiaomage on 2024/12/17.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import UIKit

extension String {
    var hexColor: UIColor {
        UIColor.init(hex: self)
    }
}

public extension UIColor {
    convenience init(hex: String) {
        self.init(hex: hex, alpha: 1)
    }
    
    convenience init(hex: String, alpha: CGFloat) {
        var real = hex
        if hex.lengthOfBytes(using: .ascii) == 7 {
            real = String(hex.dropFirst())
        }
        
        let number = UInt(real, radix: 16) ?? 0
        
        let red = CGFloat((number & 0xff0000) / 0x10000)
        let green = CGFloat((number & 0x00ff00) / 0x100)
        let blue = CGFloat(number & 0x0000ff)
        self.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }
    
    // 黑暗模式适配
    convenience init(lightHex: String, wAlpha: CGFloat = 1, darkHex: String, dAlpha: CGFloat = 1) {
        if #available(iOS 13.0, *) {
            self.init { traitCollection -> UIColor in
                if traitCollection.userInterfaceStyle == .light {
                    return UIColor(hex: lightHex, alpha: wAlpha)
                } else {
                    return UIColor(hex: darkHex, alpha: dAlpha)
                }
            }
        } else {
            self.init(hex: lightHex, alpha: wAlpha)
        }
    }
    
    convenience init(light: UIColor, dark: UIColor) {
        if #available(iOS 13.0, *) {
            self.init(dynamicProvider: {
                switch $0.userInterfaceStyle {
                case .light, .unspecified:
                    return light
                case .dark:
                    return dark
                @unknown default:
                    assertionFailure("Unknown userInterfaceStyle: \($0.userInterfaceStyle)")
                    return light
                }
            })
        } else {
            self.init(cgColor: light.cgColor)
        }
    }
}
