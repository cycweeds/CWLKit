//
//  RuntimeTest.swift
//  Tests
//
//  Created by cyc on 6/16/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import CWLKit
import XCTest


class NN: NSObject {
    private var a = "1"
    var b = 2
}

class RuntimeTest: XCTestCase {
    func testSubclasses() {
       print(NN.getIvars())
    }
}
