//
//  UIEdgeInsets+Ex.swift
//  CWLKit
//
//  Created by cyc on 3/29/21.
//

import Foundation
import UIKit

extension UIEdgeInsets {
    
    /// init(top: inset, left: inset, bottom: inset, right: inset)
    init(inset: CGFloat) {
        self.init(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    init(leftAndRight: CGFloat) {
        self.init(top: 0, left: leftAndRight, bottom: 0, right: leftAndRight)
    }
    
    init(topAndBottom: CGFloat) {
        self.init(top: topAndBottom, left: 0, bottom: topAndBottom, right: 0)
    }
    
    func add(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) -> Self {
        let origin = self
        return UIEdgeInsets(top: origin.top + top, left: origin.left + left, bottom: origin.bottom + bottom, right: origin.right + right)
    }
    
    var vertical: CGFloat {
        return top + bottom
    }

    var horizontal: CGFloat {
        return left + right
    }
}
