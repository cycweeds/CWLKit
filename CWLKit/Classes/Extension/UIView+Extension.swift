//
//  UIView+Extension.swift
//  CWLKit
//
//  Created by cyc on 2018/11/6.
//

import UIKit

// just easy to  use
extension UIView {
    public var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        
        set {
            frame.origin.x = newValue
        }
    }
    
    public var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        
        set {
            frame.origin.y = newValue
        }
    }
    
    public var width: CGFloat {
        get {
            return self.frame.size.width
        }
        
        set {
            frame.size.width = newValue
        }
    }
    
    public var height: CGFloat {
        get {
            return self.frame.size.height
        }
        
        set {
            frame.size.height = newValue
        }
    }
    
    public var size: CGSize {
        get {
            return frame.size
        }
        
        set {
            width = newValue.width
            height = newValue.height
        }
    }
    
    public var center_x: CGFloat {
        get {
            return self.center.x
        }
    }
    
    public var center_y: CGFloat {
        get {
            return self.center.y
        }
    }
    
    public var max_x: CGFloat {
        get {
            return self.frame.maxX
            
        }
    }
    
    public var max_y: CGFloat {
        get {
            return self.frame.maxY
        }
    }
    
    public var mid_x: CGFloat {
        get {
            return self.frame.minX
        }
    }
    
    public var mid_y: CGFloat {
        get {
            return self.frame.minY
        }
    }
}


//MARK:- Xib or Storyboard Needs
extension UIView {
    @IBInspectable public var cornerRadius : CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = self.layer.cornerRadius > 0
        }
    }
    
    @IBInspectable public var borderWidth : CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable public var borderColor : UIColor? {
        get {
            return self.layer.borderColor != nil
                ? UIColor(cgColor: self.layer.borderColor!)
                : nil
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable public var shadowColor: UIColor? {
        get {
            guard let color = layer.shadowColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }
    
    @IBInspectable public var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable public var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable public var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
}

extension UIView {
    
    /// 获取试图某一点的颜色
    ///
    /// - Parameter point: 当前view内的位置
    /// - Returns: UIColor
    public func cwl_colorOfPoint(point: CGPoint) -> UIColor {
        let pixel = UnsafeMutableRawPointer.allocate(byteCount: 4 * MemoryLayout<UInt8>.stride, alignment: MemoryLayout<UInt8>.alignment)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGImageAlphaInfo.premultipliedLast.rawValue
        guard let context = CGContext(data: pixel, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: colorSpace, bitmapInfo: bitmapInfo) else {
            return UIColor.clear
        }
        context.translateBy(x: -point.x, y: -point.y)
        self.layer.render(in: context)
        
        let red: CGFloat = CGFloat(pixel.load(fromByteOffset: 0, as: UInt8.self)) / 255.0
        let green: CGFloat = CGFloat(pixel.load(fromByteOffset: 1, as: UInt8.self)) / 255.0
        let blue: CGFloat = CGFloat(pixel.load(fromByteOffset: 2, as: UInt8.self)) / 255.0
        let alpha: CGFloat = 1.0
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    
    /// 生成UIImage
    ///
    /// - Parameter size: nil默认和自身frame大小一致
    /// - Returns: UIImage对象
    func generateImage(size: CGSize? = nil) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size ?? self.frame.size, false, kScale)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}



