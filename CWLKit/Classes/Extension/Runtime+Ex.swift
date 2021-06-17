//
//  Runtime+Ex.swift
//  CWLKit
//
//  Created by cyc on 6/16/21.
//

import Foundation



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


/// 如果需要用对应的类型，字典定义Dictionary<String, Any>，对应value为Int8.self、Int16.self，下面用到的方法都需要更改为Dictionary<String, Any>
let valueTypesMap: [String: String] = [
    "c" : "Int8",
    "s" : "Int16",
    "i" : "Int32",
    "q" : "Int",
    "S" : "UInt16",
    "I" : "UInt32",
    "Q" : "UInt",
    "B" : "Bool",
    "d" : "Double",
    "f" : "Float",
    "{" : "Decimal"
]





public extension NSObject {
    
    /// 获取继承自该类的所有子类
    ///
    /// - Returns: 子类名称数组
    class func subclasses() -> [String] {
        var count: UInt32 = 0, result: [String] = []
        let allClasses: AutoreleasingUnsafeMutablePointer<AnyClass> = objc_copyClassList(&count)!
        for n in 0 ..< count {
            let someClass: AnyClass = allClasses[Int(n)]
            guard let someSuperClass = class_getSuperclass(someClass), String(describing: someSuperClass) == String(describing: self) else { continue }
            //返回的类会带module名，如果把module名截取了，就无法转换成对应的类了
            let className = NSStringFromClass(someClass)
            
            result.append(className)
        }
        return result
    }
    
    class func getIvars() -> [String: String] {
        var count: UInt32 = 0
        guard let ivars = class_copyIvarList(self, &count) else { return [:] }
        
        for i in 0..<count {
            let ivar = ivars[Int(i)]
            let name = ivar_getName(ivar)
            let string = String(utf8String: name!)
            if string != nil {
                print(string!)                
            }
        }
        
        return [:]
    }
    
    /// 获取属性名和类型列表
    ///
    /// - Returns: 属性名和类型的字典
    class func getProperties() -> [String: String]? {
        var count = UInt32()
        guard let properties = class_copyPropertyList(self, &count) else { return nil }
        var types: [String: String] = [:]
        for i in 0..<Int(count) {
            let property: objc_property_t = properties[i]
            /// 获取属性名
            guard let name = getNameOf(property: property)
                else { continue }
            /// 获取属性类型
            let type = getTypeOf(property: property)
            types[name] = type
        }
        free(properties)
        return types
    }
    
    /// 获取属性名
    ///
    /// - Parameter property: 属性对象
    /// - Returns: 属性名
    private class func getNameOf(property: objc_property_t) -> String? {
        guard
            let name: NSString = NSString(utf8String: property_getName(property))
            else { return nil }
        return name as String
    }
    
    /// attributes对应的类型
    ///
    /// - Parameter attributes: attributes
    /// - Returns: 类型名
    private class func valueType(withAttributes attributes: String) -> String? {
        let tmp = attributes as NSString
        let letter = tmp.substring(with: NSMakeRange(1, 1))
        guard let type = valueTypesMap[letter] else { return nil }
        return type
    }
    
    /// 获取属性类型
    ///
    /// - Parameter property: 属性对象
    /// - Returns: 属性类型
    private class func getTypeOf(property: objc_property_t) -> String? {
        guard let attributesAsNSString: NSString = NSString(utf8String: property_getAttributes(property)!) else { return nil }
        let attributes = attributesAsNSString as String
        let slices = attributes.components(separatedBy: "\"")
        guard slices.count > 1 else { return valueType(withAttributes: attributes) }
        let objectClassName = slices[1]
        return objectClassName
    }
}
