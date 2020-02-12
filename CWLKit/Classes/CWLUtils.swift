//
//  CWLUtils.swift
//  CWLKit
//
//  Created by cyc on 2018/11/6.
//
import Foundation

public let kScreenWidth: CGFloat = UIScreen.main.bounds.width

public let kScreenHeight: CGFloat = UIScreen.main.bounds.height

public let kScreenBounds: CGRect = UIScreen.main.bounds

public let kScale: CGFloat = UIScreen.main.scale

public let appKeyWindow: UIWindow? = UIApplication.shared.delegate?.window ?? nil




public func swizzleMethod(aClass: AnyClass, originalSelector: Selector, swizzleSelector: Selector) {
    guard let originalMethod = class_getInstanceMethod(aClass, originalSelector) else { return }
    guard let swizzledMethod = class_getInstanceMethod(aClass, swizzleSelector) else { return }
    
    
    // 要先尝试添加原 selector 是为了做一层保护，因为如果这个类没有实现 originalSelector ，但其父类实现了，那 class_getInstanceMethod 会返回父类的方法。这样 method_exchangeImplementations 替换的是父类的那个方法，这当然不是你想要的。
    let isAdd = class_addMethod(aClass, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
    if isAdd {
        class_replaceMethod(aClass, swizzleSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
        
    
}
