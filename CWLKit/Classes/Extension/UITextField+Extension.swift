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
    /// - Parameter padding: amount of padding to apply to the left of the textfield rect.
    func addPaddingLeft(_ padding: CGFloat) {
        base.leftView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: base.frame.height))
        base.leftViewMode = .always
    }

    /// SwifterSwift: Add padding to the right of the textfield rect.
    ///
    /// - Parameter padding: amount of padding to apply to the right of the textfield rect.
    func addPaddingRight(_ padding: CGFloat) {
        base.rightView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: base.frame.height))
        base.rightViewMode = .always
    }

    /// SwifterSwift: Add padding to the left of the textfield rect.
    ///
    /// - Parameters:
    ///   - image: left image.
    ///   - padding: amount of padding between icon and the left of textfield.
    func addPaddingLeftIcon(_ image: UIImage, padding: CGFloat) {
        let iconView = UIView(frame: CGRect(x: 0, y: 0, width: image.size.width + padding, height: image.size.height))
        let imageView = UIImageView(image: image)
        imageView.frame = iconView.bounds
        imageView.contentMode = .center
        iconView.addSubview(imageView)
        base.leftView = iconView
        base.leftViewMode = .always
    }

    /// SwifterSwift: Add padding to the right of the textfield rect.
    ///
    /// - Parameters:
    ///   - image: right image.
    ///   - padding: amount of padding between icon and the right of textfield.
    func addPaddingRightIcon(_ image: UIImage, padding: CGFloat) {
        let iconView = UIView(frame: CGRect(x: 0, y: 0, width: image.size.width + padding, height: image.size.height))
        let imageView = UIImageView(image: image)
        imageView.frame = iconView.bounds
        imageView.contentMode = .center
        iconView.addSubview(imageView)
        base.rightView = iconView
        base.rightViewMode = .always
    }
}
