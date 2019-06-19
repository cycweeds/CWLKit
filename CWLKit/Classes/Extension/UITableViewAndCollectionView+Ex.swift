//
//  UITableViewAndCollectionView+Ex.swift
//  CWLKit
//
//  Created by cyc on 2019/6/19.
//

import Foundation

protocol DefaultIdentifierProtocol {
    static func defaultIdentifier() -> String
}

extension UITableViewCell: DefaultIdentifierProtocol {
    public static func defaultIdentifier() -> String {
        return String(describing: self)
    }
}

extension UITableViewHeaderFooterView: DefaultIdentifierProtocol {
    public static func defaultIdentifier() -> String {
        return String(describing: self)
    }
}

extension UICollectionReusableView: DefaultIdentifierProtocol {
    public static func defaultIdentifier() -> String {
        return String(describing: self)
    }
}




extension UITableView {
    
    public func cwl_registerCell<T: UITableViewCell>(class: T.Type) {
        self.register(`class`, forCellReuseIdentifier: `class`.defaultIdentifier())
    }
    
    public func cwl_registerNibCell<T: UITableViewCell>(class: T.Type, nibBunlde: Bundle? = nil) {
        self.register(UINib(nibName: `class`.defaultIdentifier(), bundle: nibBunlde), forCellReuseIdentifier: `class`.defaultIdentifier())
    }
    
    public func cwl_registerHeadFooterView<T: UITableViewHeaderFooterView>(class: T.Type) {
        self.register(`class`, forHeaderFooterViewReuseIdentifier: `class`.defaultIdentifier())
    }
    
    public func cwl_registerNibHeadFooterView<T: UITableViewHeaderFooterView>(class: T.Type, nibBunlde: Bundle? = nil) {
        self.register(UINib(nibName: `class`.defaultIdentifier(), bundle: nibBunlde), forHeaderFooterViewReuseIdentifier: `class`.defaultIdentifier())
    }
    
    public func cwl_dequeueResuableCell<T: UITableViewCell>(class: T.Type, indexPath: IndexPath? = nil) -> T {
        let reuseIdentifier = `class`.defaultIdentifier()
        if let indexPath = indexPath {
            return self.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! T
        } else {
            return self.dequeueReusableCell(withIdentifier: reuseIdentifier)! as! T
        }
        
    }
    
    public func cwl_dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(class: T.Type) -> T {
        let reuseIdentifier = `class`.defaultIdentifier()
        return self.dequeueReusableHeaderFooterView(withIdentifier: reuseIdentifier) as! T
    }
    
}

extension UICollectionView {
    public func cwl_registerCell<T: UICollectionViewCell>(class: T.Type) {
        self.register(`class`, forCellWithReuseIdentifier: `class`.defaultIdentifier())
    }
    
    public func cwl_registerNibCell<T: UICollectionViewCell>(class: T.Type, nibBunlde: Bundle? = nil) {
        let reuseIdentifier = `class`.defaultIdentifier()
        self.register(UINib(nibName: reuseIdentifier, bundle: nibBunlde), forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    public func cwl_register<T: UICollectionReusableView>(class: T.Type, forSupplementaryViewOfKind elementKind: String) {
         self.register(`class`, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: `class`.defaultIdentifier())
    }
    
    public func registerNib<T: UICollectionReusableView>(class: T.Type, forSupplementaryViewOfKind elementKind: String, nibBunlde: Bundle? = nil) {
        let identifier = `class`.defaultIdentifier()
        self.register(UINib(nibName: identifier, bundle: nibBunlde), forSupplementaryViewOfKind: elementKind, withReuseIdentifier: identifier)
    }
    
    public func cwl_dequeueReusableCell<T: UICollectionViewCell>(class: T.Type, indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: `class`.defaultIdentifier(), for: indexPath) as! T
    }
    
    public func cwl_dequeueReusableSupplementaryView<T: UICollectionReusableView>(class: T.Type, kind: String, indexPath: IndexPath) -> T {
        return self.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: `class`.defaultIdentifier(), for: indexPath) as! T
    }
    
}
