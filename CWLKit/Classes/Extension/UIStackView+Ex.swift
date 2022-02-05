//
//  UIStackView+Ex.swift
//  Pods
//
//  Created by cyc on 2022/2/4.
//


#if canImport(UIKit) && !os(watchOS)
import UIKit

public extension UIStackView {
    
    func removeAllArrangedSubview() {
        for view in arrangedSubviews {
            removeArrangedSubview(view)
        }
    }
}

#endif
