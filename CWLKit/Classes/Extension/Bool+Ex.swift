//
//  Bool+Ex.swift
//  CWLKit
//
//  Created by cyc on 3/29/21.
//

import Foundation

public extension Bool {
    
    var intValue: Int {
        return self ? 1 : 0
    }

    var stringValue: String {
        return self ? "true" : "false"
    }
}
