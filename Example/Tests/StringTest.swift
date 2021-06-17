//
//  CWLKit_ExampleTests.swift
//  CWLKit_ExampleTests
//
//  Created by cyc on 2018/11/8.
//  Copyright © 2018 CocoaPods. All rights reserved.
//


import CWLKit
import XCTest


class StringTest: XCTestCase {

    func testStringToInt() {
        XCTAssert("1".intValue == 1)
        XCTAssertNil("1.1".intValue)
        XCTAssertNil("33你".intValue)
    }
    
    func testStringToImage() {
        XCTAssertNil("aa".toImage)
        XCTAssertNotNil("location".toImage)
    }
    
    func testIsEmail() {
        XCTAssert("1234567@qq.com".isEmail)
        XCTAssert("fsf@Gmail.com".isEmail)
        XCTAssert("ccccc@163.cn".isEmail)
        XCTAssertFalse("fsfGmail.com".isEmail)
    }


    func testReversed() {
        var str1 = "你好"
        XCTAssert(str1.reverse() == "好你")
        var str2 = "🐴好"
        XCTAssert(str2.reverse() == "好🐴")
    }
    
    func testIsHttpOrHttpsURL() {
        XCTAssertFalse("http://www.google.com".isHttpsUrl)
        XCTAssert("https://www.google.com".isHttpsUrl)
    }

}
