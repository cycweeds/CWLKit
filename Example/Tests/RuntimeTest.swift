//
//  RuntimeTest.swift
//  Tests
//
//  Created by cyc on 6/16/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import CWLKit
import XCTest


@objcMembers
class TestObject: NSObject {
    private var a = "1"
    var b: UIView!
    
  
}

class RuntimeTest: XCTestCase {
    
    func testSubclasses() {
//        print(UIView.subclasses())

    }
    
    func testIvarList() {
        for item in UIView.getIvars() {
            print("\(item.key): \(item.value)\n")
        }
    }
    
    
    func testPropertyList() {
        for item in UIView.getProperties() ?? [:] {
            print("\(item.key): \(item.value)\n")
        }
    }
}
