//
//  UIImage+Extension.swift
//  CWLKit
//
//  Created by cyc on 2018/11/8.
//

import Foundation

extension UIImage {
    
    public static func image(_ color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
