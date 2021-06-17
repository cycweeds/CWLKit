//
//  Test.swift
//  Tests
//
//  Created by cyc on 6/16/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//


import CWLKit
import XCTest


class BoolTest: XCTestCase {


    func testBool() {
        XCTAssertTrue(true.intValue == 1)
        XCTAssertTrue(false.intValue == 0)
        
        XCTAssertTrue(true.stringValue == "true")
        XCTAssertTrue(false.stringValue == "false")
    }

}
