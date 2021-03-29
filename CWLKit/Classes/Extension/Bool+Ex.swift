//
//  Bool+Ex.swift
//  CWLKit
//
//  Created by cyc on 3/29/21.
//

import Foundation

public extension Bool {
    var int: Int {
        return self ? 1 : 0
    }

    var string: String {
        return self ? "true" : "false"
    }
}
