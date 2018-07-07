
import UIKit

// just to easy use
extension UIView {
    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
    }
    
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
    }
    
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
    }
    
    var height: CGFloat {
        get {
            return self.frame.size.height
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
    
    var mid_x: CGFloat {
        get {
            return self.frame.minX
        }
    }
    
    var mid_y: CGFloat {
        get {
            return self.frame.minY
        }
    }
    
}


extension UIView {
    
    func toImage(_ size: CGSize) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        let ctx = UIGraphicsGetCurrentContext()
        
        ctx!.saveGState()
        layer.render(in: ctx!)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return img!
    }
}



// Xib or Storyboard needs
extension UIView {
    @IBInspectable var cw_cornerRadius : CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = self.layer.cornerRadius > 0
        }
    }
    
    @IBInspectable var cw_borderWidth : CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
            
        }
    }
    
    @IBInspectable var cw_borderColor : UIColor? {
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
