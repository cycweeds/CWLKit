//
//  DispatchQueue.swift
//  CWLKit
//
//  Created by cyc on 2018/11/8.
//

import Foundation


extension DispatchQueue {
    public static func cwl_mainThreadAsync(_ excute: @escaping () -> ()) {
        if Thread.current.isMainThread {
            excute()
        } else {
            DispatchQueue.main.async {
                excute()
            }
        }
    }
    
    public func cwl_delay(second: TimeInterval, execute: @escaping () -> ()) {
        self.asyncAfter(deadline: .now() + second, execute: execute)
        
    }
}
