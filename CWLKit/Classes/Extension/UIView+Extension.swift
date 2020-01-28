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



