//
//  UIDevice+Extension.swift
//  CWLKit
//
//  Created by cyc on 2018/12/4.
//

import Foundation

extension UIDevice {
    
    /// 是否越狱
    public static var isJailBreak: Bool {
        let jailBreakFilePaths: [String] = ["/Applications/Cydia.app",
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
