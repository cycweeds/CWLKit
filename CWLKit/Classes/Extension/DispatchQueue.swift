//
//  DispatchQueue.swift
//  CWLKit
//
//  Created by cyc on 2018/11/8.
//

import Foundation

extension DispatchQueue: CWLProtocol { }
public extension CWLKit where Base: DispatchQueue {
    static func mainThreadAsync(_ excute: @escaping () -> ()) {
        if Thread.current.isMainThread {
            excute()
        } else {
            DispatchQueue.main.async {
                excute()
            }
        }
    }
    
    func delay(second: TimeInterval, execute: @escaping () -> ()) {
        base.asyncAfter(deadline: .now() + second, execute: execute)
        
    }
}
