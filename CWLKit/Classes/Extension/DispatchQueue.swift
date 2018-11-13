//
//  DispatchQueue.swift
//  CWLKit
//
//  Created by cyc on 2018/11/8.
//

import Foundation


extension DispatchQueue {
    public static func mainThreadAsync(_ excute: @escaping () -> ()) {
        if Thread.current.isMainThread {
            excute()
        } else {
            DispatchQueue.main.async {
                excute()
            }
        }
    }
    
    
    public func delay(second: TimeInterval, execute: @escaping () -> ()) {
        self.asyncAfter(deadline: .now() + second, execute: execute)
        
    }
}
