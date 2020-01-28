//
//  CGF.swift
//  CWLKit
//
//  Created by cyc on 2020/1/28.
//

import Foundation


extension CGSize {

    func scaled(_ scale: CGFloat) -> CGSize {
        return CGSize(width: self.width * scale, height: self.height * scale)
    }
}

