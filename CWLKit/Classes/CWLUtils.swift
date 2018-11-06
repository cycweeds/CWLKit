//
//  CWLUtils.swift
//  CWLKit
//
//  Created by cyc on 2018/11/6.
//
import Foundation

public let kScreenWidth: CGFloat = UIScreen.main.bounds.width

public let kScreenHeight: CGFloat = UIScreen.main.bounds.height

public let kScreenBounds: CGRect = UIScreen.main.bounds

public let kScale: CGFloat = UIScreen.main.scale

public let appKeyWindow: UIWindow? = UIApplication.shared.delegate?.window ?? nil





public func safeMainThreadAsync(_ code: @escaping () -> ()) {
    if Thread.current.isMainThread {
        code()
    } else {
        DispatchQueue.main.async {
            code()
        }
    }
}

