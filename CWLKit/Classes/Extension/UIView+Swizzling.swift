//
//  UIView+Swizzling.swift
//  CWLKit
//
//  Created by cyc on 2020/2/3.
//

import Foundation


public extension UIView {
    private static let swizzlePointImplementation: Void = {
        swizzleMethod(aClass: UIView.self, originalSelector: #selector(point(inside:with:)), swizzleSelector: #selector(swizzlePoint(inside:with:)))
    }()
    
    private static var HotPointKey = "HotPointKey"
    
    /// 点击区域增加
    var expandHotPoint: UIEdgeInsets? {
        set {
            _ = UIView.swizzlePointImplementation
            objc_setAssociatedObject(self, &UIView.HotPointKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        
        get {
            return objc_getAssociatedObject(self, &UIView.HotPointKey) as? UIEdgeInsets
        }
    }
    
    @objc func swizzlePoint(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if let expandHotPoint = expandHotPoint {
            let hotPointFrame = CGRect(x: -expandHotPoint.left, y: -expandHotPoint.top, width: frame.size.width + expandHotPoint.left + expandHotPoint.right, height: frame.size.height + expandHotPoint.top + expandHotPoint.bottom)
            return hotPointFrame.contains(point)
        } else {
            return self.swizzlePoint(inside: point, with: event)
        }
    }
    
}



