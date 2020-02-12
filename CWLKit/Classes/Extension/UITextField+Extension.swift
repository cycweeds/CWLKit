//
//  UITextFieldView+Extension.swift
//  CWLKit
//
//  Created by cyc on 2020/2/3.
//

import Foundation

public extension CWLKit where Base: UITextField {
    
    
    /// SwifterSwift: Add padding to the left of the textfield rect.
    ///
    /// - Parameters:
    ///   - image: left image
    ///   - padding: amount of padding between icon and the left of textfield
    func addPaddingLeft(image: UIImage? = nil, padding: CGFloat) {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .center
        base.leftView = imageView
        base.leftView?.frame.size = CGSize(width: (image?.size.width ?? 0) + padding, height: image?.size.height ?? 0)
        base.leftViewMode = .always
    }
    
    /// SwifterSwift: Add padding to the left of the textfield rect.
       ///
       /// - Parameters:
       ///   - image: left image
       ///   - padding: amount of padding between icon and the left of textfield
       func addPaddingRight(image: UIImage? = nil, padding: CGFloat) {
           let imageView = UIImageView(image: image)
           imageView.contentMode = .center
           base.rightView = imageView
           base.rightView?.frame.size = CGSize(width: (image?.size.width ?? 0) + padding, height: image?.size.height ?? 0)
           base.rightViewMode = .always
       }
}
