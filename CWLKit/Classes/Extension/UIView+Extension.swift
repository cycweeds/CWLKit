//
//  UIView+Extension.swift
//  CWLKit
//
//  Created by cyc on 2018/11/6.
//

import UIKit

public extension UIView {
     var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        
        set {
            frame.origin.x = newValue
        }
    }
    
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        
        set {
            frame.origin.y = newValue
        }
    }
    
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        
        set {
            frame.size.width = newValue
        }
    }
    
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        
        set {
            frame.size.height = newValue
        }
    }
    
    var size: CGSize {
        get {
            return frame.size
        }
        
        set {
            width = newValue.width
            height = newValue.height
        }
    }
    
    var center_x: CGFloat {
        get {
            return self.center.x
        }
    }
    
    var center_y: CGFloat {
        get {
            return self.center.y
        }
    }
    
    var max_x: CGFloat {
        get {
            return self.frame.maxX
            
        }
    }
    
    var max_y: CGFloat {
        get {
            return self.frame.maxY
        }
    }
    
    var maxY: CGFloat {
        get {
            return self.frame.maxY
        }
    }
    
    var mid_x: CGFloat {
        get {
            return self.frame.midX
        }
    }
    
    var midX: CGFloat {
        get {
            return self.frame.midX
        }
    }
    
    var mid_y: CGFloat {
        get {
            return self.frame.midY
        }
    }
    
    var midY: CGFloat {
        get {
            return self.frame.midY
        }
    }
}


//MARK:- Xib or Storyboard Needs
public extension UIView {
    @IBInspectable var cornerRadius : CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = self.layer.cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth : CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor : UIColor? {
        get {
            return self.layer.borderColor != nil
                ? UIColor(cgColor: self.layer.borderColor!)
                : nil
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        get {
            guard let color = layer.shadowColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
}

public extension UIView {
    static func xibView(owner: Any? = nil) -> Self {
        return Bundle.main.loadNibNamed(String(describing: self), owner: owner, options: nil)?.first as! Self
    }
}

