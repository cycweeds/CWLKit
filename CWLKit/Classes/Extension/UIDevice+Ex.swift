//
//  UIDevice+Extension.swift
//  CWLKit
//
//  Created by cyc on 2018/12/4.
//

import Foundation

public extension UIDevice {
    
    /// 是否越狱
    static var isJailBreak: Bool {
        
        // 默认苹果是只能访问沙盒路径下的权限  但是破解了能访问全部目录
        
        let jailBreakFilePaths: [String] = ["/Applications/Cydia.app", // Cydia 一款苹果破解软件
                                  "/Library/MobileSubstrate/MobileSubstrate.dylib",
                                  "/bin/bash",
                                  "/usr/sbin/sshd",
                                  "/etc/apt"]
        for path in jailBreakFilePaths {
            if FileManager.default.fileExists(atPath: path) {
                return true
            }
        }
        return false
    }
}
