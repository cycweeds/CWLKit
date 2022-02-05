//
//  UIEdgeInsets+Ex.swift
//  CWLKit
//
//  Created by cyc on 3/29/21.
//

import Foundation
import UIKit

public extension UIEdgeInsets {
    
    /// init(top: inset, left: inset, bottom: inset, right: inset)
    init(inset: CGFloat) {
        self.init(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    /// init(top: 0, left: leftAndRight, bottom: 0, right: leftAndRight)
    init(leftAndRight: CGFloat) {
        self.init(top: 0, left: leftAndRight, bottom: 0, right: leftAndRight)
    }
    
    init(topAndBottom: CGFloat) {
        self.init(top: topAndBottom, left: 0, bottom: topAndBottom, right: 0)
    }
    
    func add(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) -> Self {
        return UIEdgeInsets(top: self.top + top, left: self.left + left, bottom: self.bottom + bottom, right: self.right + right)
    }
    
    func add(vertical: CGFloat) -> Self {
        return UIEdgeInsets(top: top + vertical / 2, left: self.left + left, bottom: bottom + vertical / 2, right: right)
    }
    
    func add(horizontal: CGFloat) -> Self {
        return UIEdgeInsets(top: top, left: left + horizontal / 2, bottom: bottom, right: right + horizontal / 2)
    }

    func add(other: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsets(top: top + other.top,
                          left: left + other.left,
                          bottom: bottom + other.bottom,
                          right: right + other.right)
    }
    
    
    /// 竖向的间距和  top + bottom
    var vertical: CGFloat {
        return top + bottom
    }

    /// 横向的间距和  left + right
    var horizontal: CGFloat {
        return left + right
    }


}
