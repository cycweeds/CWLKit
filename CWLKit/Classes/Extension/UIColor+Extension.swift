//
//  UIColor+Extension.swift
//  CWLKit
//
//  Created by cyc on 2018/11/6.
//

import Foundation

extension UIColor {
    
    
    /// 用字符串初始化
    ///
    /// - Parameters:
    ///   - hexString: 0x 、 # 开头   + 6位字符串
    ///   - alpha: 透明度
    public convenience init(hexString: String, alpha: CGFloat = 1.0) {
        var formatted = hexString.replacingOccurrences(of: "0x", with: "")
        formatted = formatted.replacingOccurrences(of: "#", with: "")
        if let hex = Int(formatted, radix: 16) {
            let red = CGFloat(CGFloat((hex & 0xFF0000) >> 16)/255.0)
            let green = CGFloat(CGFloat((hex & 0x00FF00) >> 8)/255.0)
            let blue = CGFloat(CGFloat((hex & 0x0000FF) >> 0)/255.0)
            self.init(red: red, green: green, blue: blue, alpha: alpha)
        } else {
            fatalError("color not exist")
        }
    }
    
    /// Red component of UIColor (get-only) 0-255
    public var redComponent: Int {
        var r: CGFloat = 0
        getRed(&r, green: nil, blue: nil, alpha: nil)
        return Int(r * 255)
    }
    
    /// Green component of UIColor (get-only) 0-255
    public var greenComponent: Int {
        var g: CGFloat = 0
        getRed(nil, green: &g, blue: nil, alpha: nil)
        return Int(g * 255)
    }
    
    /// Blue component of UIColor (get-only) 0-255
    public var blueComponent: Int {
        var b: CGFloat = 0
        getRed(nil, green: nil, blue: &b, alpha: nil)
        return Int(b * 255)
    }
    
    /// Alpha of UIColor (get-only)  0-1
    public var alpha: CGFloat {
        var a: CGFloat = 0
        getRed(nil, green: nil, blue: nil, alpha: &a)
        return a
    }
    
    /// SwifterSwift: Hexadecimal value string (read-only).
     var hexString: String {
         let components: [Int] = {
             let comps = cgColor.components!
             let components = comps.count == 4 ? comps : [comps[0], comps[0], comps[0], comps[1]]
             return components.map { Int($0 * 255.0) }
         }()
         return String(format: "#%02X%02X%02X", components[0], components[1], components[2])
     }
}
