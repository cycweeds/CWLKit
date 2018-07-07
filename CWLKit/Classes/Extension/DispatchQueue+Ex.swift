//
//  +Extension.swift
//  CWLKit
//
//  Created by cyc on 2018/7/8.
//

import Foundation


extension DispatchQueue {
    
    class func safeAsync(_ code: @escaping () -> ()) {
        if Thread.current.isMainThread {
            code()
        } else {
            DispatchQueue.main.async {
                code()
            }
        }
    }
}
