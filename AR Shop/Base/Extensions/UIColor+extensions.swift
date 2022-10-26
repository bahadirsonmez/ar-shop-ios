//
//  UIColor+extensions.swift
//  AR Shop
//
//  Created by Bahadır Sönmez on 9.01.2022.
//

import UIKit

extension UIColor {
    public convenience init(rgba: String) {
        var red:   CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue:  CGFloat = 0.0
        var alpha: CGFloat = 1.0
        var _rgba: String = ""
        if !rgba.hasPrefix("#") {
            _rgba = "#\(rgba)"
        } else {
            _rgba = rgba
        }
//        if rgba.hasPrefix("#") {
            let index   = _rgba.index(_rgba.startIndex, offsetBy: 1)
            //let hex     = rgba.substring(from: index)
            let hex     = String(_rgba[index...])
            let scanner = Scanner(string: hex)
            var hexValue: CUnsignedLongLong = 0
            if scanner.scanHexInt64(&hexValue) {
                switch (hex.count) {
                case 3:
                    red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
                    green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
                    blue  = CGFloat(hexValue & 0x00F)              / 15.0
                case 4:
                    red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
                    green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
                    blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
                    alpha = CGFloat(hexValue & 0x000F)             / 15.0
                case 6:
                    red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
                    green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
                    blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
                case 8:
                    red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                    green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                    blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                    alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
                default:
                    print("Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8", terminator: "")
                }
            } else {
                print("Scan hex error")
            }
//        } else {
//            print("Invalid RGB string, missing '#' as prefix", terminator: "")
//        }
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}

// MARK: - App Colors
extension UIColor {
    // Text Colors
    static let mainTextColor = UIColor(rgba: "#2D2D2F")
    static let secondaryTextColor = UIColor(rgba: "#8D8D8E")
    static let blueTextColor = UIColor(rgba: "#2967FF")

    // Bar Colors
    static let barTintColor = UIColor.systemBlue
    
    // View Background Colors
    static let backgroundColor = UIColor.white
    
    // Gray Colors
    static let appGray = UIColor(rgba: "#F6F6F6")
    static let gray30 = UIColor(rgba: "#D0D0D0")
    static let grayBackground = UIColor(rgba: "#E6E6E7")

    // Button Colors
    static let orangeColor = UIColor(rgba: "#FFA601")

}
