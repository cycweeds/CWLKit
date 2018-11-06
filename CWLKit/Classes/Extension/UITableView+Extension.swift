//
//  UITableView+Extension.swift
//  CWLKit
//
//  Created by cyc on 2018/11/6.
//

import Foundation


extension UITableView {
    
    /// 取消自动适配功能
    public func cwl_cancelSelfSizing() {
        self.estimatedRowHeight = 0
        self.estimatedSectionFooterHeight = 0
        self.estimatedSectionHeaderHeight = 0
    }
    
 
}
