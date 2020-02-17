//
//  UIView+CWL+Ex.swift
//  CWLKit
//
//  Created by cyc on 2020/1/28.
//

import Foundation

extension UIView: CWLProtocol { }

public extension CWLKit where Base: UIView {
    
    static func xibView<T: UIView>(classname: T.Type, owner: Any?, options: [UINib.OptionsKey : Any]? = nil) -> T {
            if let view = Bundle.main.loadNibNamed(String(describing: classname), owner: owner, options: options)?.first as? T {
                return view
            } else {
                fatalError("xib view not exist")
            }
        }
    
    /// 获取View某一点的颜色
    ///
    /// - Parameter point: 当前view内的位置
    /// - Returns: UIColor
    func colorOfPoint(point: CGPoint) -> UIColor {
        let pixel = UnsafeMutableRawPointer.allocate(byteCount: 4 * MemoryLayout<UInt8>.stride, alignment: MemoryLayout<UInt8>.alignment)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGImageAlphaInfo.premultipliedLast.rawValue
        guard let context = CGContext(data: pixel, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: colorSpace, bitmapInfo: bitmapInfo) else {
            return UIColor.clear
        }
        context.translateBy(x: -point.x, y: -point.y)
        base.layer.render(in: context)
        
        let red: CGFloat = CGFloat(pixel.load(fromByteOffset: 0, as: UInt8.self)) / 255.0
        let green: CGFloat = CGFloat(pixel.load(fromByteOffset: 1, as: UInt8.self)) / 255.0
        let blue: CGFloat = CGFloat(pixel.load(fromByteOffset: 2, as: UInt8.self)) / 255.0
        let alpha: CGFloat = 1.0
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    
    /// 生成UIImage
    ///
    /// - Parameter size: nil默认和自身frame大小一致
    /// - Returns: UIImage对象
    func generateImage(size: CGSize? = nil) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size ?? base.frame.size, false, kScale)
        base.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
