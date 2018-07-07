
import UIKit

// just to easy use
extension UIView {
    public var x: CGFloat {
        get {
            return self.frame.origin.x
        }
    }
    
    public var y: CGFloat {
        get {
            return self.frame.origin.y
        }
    }
    
    public var width: CGFloat {
        get {
            return self.frame.size.width
        }
    }
    
    public var height: CGFloat {
        get {
            return self.frame.size.height
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


//MARK:- Xib or Storyboard needs
extension UIView {
    @IBInspectable public var cwl_cornerRadius : CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = self.layer.cornerRadius > 0
        }
    }
    
    @IBInspectable public var cwl_borderWidth : CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable public var cwl_borderColor : UIColor? {
        get {
            return self.layer.borderColor != nil
                ? UIColor(cgColor: self.layer.borderColor!)
                : nil
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
}

//MARK:- 可能用到的方法
extension UIView {
    
    
    /// 生产image
    ///
    /// - Parameter size:
    /// - Returns: <#return value description#>
    public func cwl_generateImage(_ size: CGSize? = nil) -> UIImage {
        let contentSize = (size != nil) ? size! : self.bounds.size
        UIGraphicsBeginImageContextWithOptions(contentSize, true, 0)
        let ctx = UIGraphicsGetCurrentContext()
        ctx!.saveGState()
        layer.render(in: ctx!)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
    
    
    
    /// 获取试图某一点的颜色
    ///
    /// - Parameter point: <#point description#>
    /// - Returns: <#return value description#>
    public func cwl_colorOfPoint (point: CGPoint) -> UIColor {
        let pixel = UnsafeMutableRawPointer.allocate(bytes: 4 * MemoryLayout<UInt8>.stride, alignedTo: MemoryLayout<UInt8>.alignment)
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
}



