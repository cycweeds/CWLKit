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

public let kBundleId: String = {
    return Bundle.main.infoDictionary?["CFBundleIdentifier"] as! String
}()

public let kBundleVersion: String = {
    return Bundle.main.infoDictionary?["CFBundleVersion"] as! String
}()

public let kAppVersion: String = {
    return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
}()

public let kAppName: String = {
    return Bundle.main.infoDictionary?["CFBundleDisplayName"] as! String
}()

