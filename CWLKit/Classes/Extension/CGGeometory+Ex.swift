//
//  CGF.swift
//  CWLKit
//
//  Created by cyc on 2020/1/28.
//

import Foundation


public extension CGSize {
    func scaled(_ scale: CGFloat) -> CGSize {
        return CGSize(width: self.width * scale, height: self.height * scale)
    }
}

public extension CGRect {
    var center: CGPoint {
        get {
            return CGPoint(x: size.width / 2, y: size.height / 2)
        }
        set {
            self.origin = CGPoint(x: newValue.x - size.width / 2, y: newValue.y - size.height / 2)
        }
    }
}
