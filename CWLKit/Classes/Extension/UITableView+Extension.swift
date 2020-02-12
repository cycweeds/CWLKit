//
//  UITableView+Extension.swift
//  CWLKit
//
//  Created by cyc on 2018/11/6.
//

import Foundation
    
public extension CWLKit where Base: UITableView {
    /// 取消自动适配功能
    func cancelSelfSizing() {
        base.estimatedRowHeight = 0
        base.estimatedSectionFooterHeight = 0
        base.estimatedSectionHeaderHeight = 0
    }
    
    var totalRows: Int {
        let sectionCount = base.numberOfSections
        var sum = 0
        for section in 0..<sectionCount {
            sum += base.numberOfRows(inSection: section)
        }
        return sum
    }
}


public extension CWLKit where Base: UICollectionView {
    var totalRows: Int {
        let sectionCount = base.numberOfSections
        var sum = 0
        for section in 0..<sectionCount {
            sum += base.numberOfItems(inSection: section)
        }
        return sum
    }
    
    /// SwifterSwift: Scroll to bottom of TableView.
    ///
    /// - Parameter animated: set true to animate scroll (default is true).
    func scrollToBottom(animated: Bool = true) {
        let bottomOffset = CGPoint(x: 0, y: base.contentSize.height - base.bounds.size.height)
        base.setContentOffset(bottomOffset, animated: animated)
    }

    /// SwifterSwift: Scroll to top of TableView.
    ///
    /// - Parameter animated: set true to animate scroll (default is true).
    func scrollToTop(animated: Bool = true) {
        base.setContentOffset(CGPoint.zero, animated: animated)
    }
    
}

