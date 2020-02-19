//
//  CWLKit.swift
//  CWLKit
//
//  Created by cyc on 2020/1/28.
//

import Foundation

public protocol CWLProtocol {
    associatedtype CompatibleType
    var cwl: CompatibleType { get }
}

public extension CWLProtocol {
    var cwl: CWLKit<Self> {
        return CWLKit(self)
    }
}



public final class CWLKit<Base> {
    let base: Base
    init(_ base: Base) {
        self.base = base
    }
}

