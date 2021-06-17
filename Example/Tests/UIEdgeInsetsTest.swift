//
//  UIEdgeInsetsTest.swift
//  Tests
//
//  Created by cyc on 6/17/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest

class UIEdgeInsetsTest: XCTestCase {


    func testInitInset() {
       let insets = UIEdgeInsets(inset: 5)
        XCTAssert(insets.left == 5)
        XCTAssert(insets.right == 5)
        XCTAssert(insets.top == 5)
        XCTAssert(insets.bottom == 5)
        
        let inset2 = UIEdgeInsets(leftAndRight: 2)
        XCTAssert(inset2.left == 2 && inset2.right == 2)
        XCTAssert(inset2.top == 0 && inset2.bottom == 0)
        
        
        let inset3 = UIEdgeInsets(topAndBottom: 9)
        XCTAssert(inset3.left == 0 && inset3.right == 0)
        XCTAssert(inset3.top == 9 && inset3.bottom == 9)
        
    }

    
    func testVerticalAndhorizontal() {
       let insets = UIEdgeInsets(inset: 10)
        XCTAssert(insets.vertical == 20)
        XCTAssert(insets.horizontal == 20)
    }

    
    func testFuncAdd() {
        let insets = UIEdgeInsets(inset: 0)
        
        XCTAssert(insets.add(top: 10).top == 10)
        XCTAssert(insets.add(left: 9).left == 9)
        XCTAssert(insets.add(bottom: 8).bottom == 8)
        XCTAssert(insets.add(right: 7).right == 7)
        
        
        
        
        
        var insets1: UIEdgeInsets = UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4)
        let insets2: UIEdgeInsets = UIEdgeInsets(top: 9, left: 8, bottom: 7, right: 6)
        insets1 = insets1.add(other: insets2)
        
        XCTAssert(insets1.left == 10)
        XCTAssert(insets1.right == 10)
        XCTAssert(insets1.top == 10)
        XCTAssert(insets1.bottom == 10)
        
    }
  


}
