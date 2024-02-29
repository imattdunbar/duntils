//
//  Color+UIColor.swift
//  Duntils
//
//  Created by Matt Dunbar on 2/28/24.
//

import UIKit
import SwiftUI

extension UIColor {

    public var SwiftUI: Color {
        return Color(self)
    }

    public static func fromHex(_ hex: String) -> UIColor {
        guard let color = UIColor(hex) else {
            return UIColor.clear
        }

        return color
    }

    public convenience init?(_ hexString: String) {
        let r, g, b, a: CGFloat

        var hex = hexString

        if !hex.hasPrefix("#") {
            hex = "#\(hexString)"
        }

        if !(hex.count == 9) {
            hex = "\(hex)FF"
        }

        let start = hex.index(hex.startIndex, offsetBy: 1)
        let hexColor = String(hex[start...])

        if hexColor.count == 8 {
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0

            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                a = CGFloat(hexNumber & 0x000000ff) / 255

                self.init(red: r, green: g, blue: b, alpha: a)
                return
            }
        }

        return nil
    }
}

extension Color {
    public static func fromHex(_ hex: String) -> Color {
        return UIColor.fromHex(hex).SwiftUI
    }
}
