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
    
    public var cwl_totalRows: Int {
        let sectionCount = self.numberOfSections
        if sectionCount == 0 {
            return 0
        }
        
        var sum = 0
        for section in 0..<sectionCount {
            sum += self.numberOfRows(inSection: section)
        }
        return sum
    }

 
}
