//
//  UICollectionView+Extension.swift
//  CWLKit
//
//  Created by cyc on 2018/11/8.
//

import Foundation




// MARK: - Methods
public extension CWLKit where Base : UIScrollView {

    /// SwifterSwift: Takes a snapshot of an entire ScrollView
    ///
    ///    AnySubclassOfUIScroolView().snapshot
    ///    UITableView().snapshot
    ///
    /// - Returns: Snapshot as UIimage for rendered ScrollView
    var snapshot: UIImage? {
        // Original Source: https://gist.github.com/thestoics/1204051
        UIGraphicsBeginImageContextWithOptions(base.contentSize, false, 0)
        defer {
            UIGraphicsEndImageContext()
        }
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        let previousFrame = base.frame
        base.frame = CGRect(origin: base.frame.origin, size: base.contentSize)
        base.layer.render(in: context)
        base.frame = previousFrame
        return UIGraphicsGetImageFromCurrentImageContext()
    }

}
