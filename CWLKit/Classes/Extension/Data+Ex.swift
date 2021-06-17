//
//  Data+Ex.swift
//  CWLKit
//
//  Created by cyc on 3/29/21.
//

import Foundation

public extension Data {
    var bytes: [UInt8] {
        return [UInt8](self)
    }
    
    func string(encoding: String.Encoding) -> String? {
        return String(data: self, encoding: encoding)
    }
}
