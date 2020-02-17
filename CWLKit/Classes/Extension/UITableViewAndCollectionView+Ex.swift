//
//  UITableViewAndCollectionView+Ex.swift
//  CWLKit
//
//  Created by cyc on 2019/6/19.
//
import Foundation


fileprivate protocol ReuseDefaultIdentifierProtocol {
    static func defaultIdentifier() -> String
}

extension ReuseDefaultIdentifierProtocol {
    public static func defaultIdentifier() -> String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReuseDefaultIdentifierProtocol { }

extension UITableViewHeaderFooterView: ReuseDefaultIdentifierProtocol { }

extension UICollectionReusableView: ReuseDefaultIdentifierProtocol { }


public extension CWLKit where Base: UITableView {
    func regiseterCells<T: UITableViewCell>(classes: [T.Type]) {
        for `class` in classes {
            self.registerCell(class: `class`)
        }
    }
    
    func registerCell<T: UITableViewCell>(class: T.Type) {
        base.register(`class`, forCellReuseIdentifier: `class`.defaultIdentifier())
    }
    
    func registerNibCells<T: UITableViewCell>(classes: [T.Type], nibBunlde: Bundle? = nil) {
        for `class` in classes {
            self.registerNibCell(class: `class`)
        }
        
    }
    
    func registerNibCell<T: UITableViewCell>(class: T.Type, nibBunlde: Bundle? = nil) {
        base.register(UINib(nibName: `class`.defaultIdentifier(), bundle: nibBunlde), forCellReuseIdentifier: `class`.defaultIdentifier())
    }
    
    func registerHeadFooterView<T: UITableViewHeaderFooterView>(class: T.Type) {
        base.register(`class`, forHeaderFooterViewReuseIdentifier: `class`.defaultIdentifier())
    }
    
    func registerNibHeadFooterView<T: UITableViewHeaderFooterView>(class: T.Type, nibBunlde: Bundle? = nil) {
        base.register(UINib(nibName: `class`.defaultIdentifier(), bundle: nibBunlde), forHeaderFooterViewReuseIdentifier: `class`.defaultIdentifier())
    }
    
    func dequeueResuableCell<T: UITableViewCell>(class: T.Type, indexPath: IndexPath? = nil) -> T {
        let reuseIdentifier = `class`.defaultIdentifier()
        if let indexPath = indexPath {
            return base.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! T
        } else {
            return base.dequeueReusableCell(withIdentifier: reuseIdentifier)! as! T
        }
        
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(class: T.Type) -> T {
        let reuseIdentifier = `class`.defaultIdentifier()
        return base.dequeueReusableHeaderFooterView(withIdentifier: reuseIdentifier) as! T
    }
}

public extension CWLKit where Base: UICollectionView {
    func regiseterCells<T: UICollectionViewCell>(classes: [T.Type]) {
        for `class` in classes {
            self.registerCell(class: `class`)
        }
    }
    
    func registerCell<T: UICollectionViewCell>(class: T.Type) {
        base.register(`class`, forCellWithReuseIdentifier: `class`.defaultIdentifier())
    }
    
    func registerNibCells<T: UICollectionViewCell>(classes: [T.Type], nibBunlde: Bundle? = nil) {
        for `class` in classes {
            self.registerNibCell(class: `class`, nibBunlde: nibBunlde)
        }
    }
    
    func registerNibCell<T: UICollectionViewCell>(class: T.Type, nibBunlde: Bundle? = nil) {
        let reuseIdentifier = `class`.defaultIdentifier()
        base.register(UINib(nibName: reuseIdentifier, bundle: nibBunlde), forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    func register<T: UICollectionReusableView>(class: T.Type, forSupplementaryViewOfKind elementKind: String) {
        base.register(`class`, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: `class`.defaultIdentifier())
    }
    
    func registerNib<T: UICollectionReusableView>(class: T.Type, forSupplementaryViewOfKind elementKind: String, nibBunlde: Bundle? = nil) {
        let identifier = `class`.defaultIdentifier()
        base.register(UINib(nibName: identifier, bundle: nibBunlde), forSupplementaryViewOfKind: elementKind, withReuseIdentifier: identifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(class: T.Type, indexPath: IndexPath) -> T {
        return base.dequeueReusableCell(withReuseIdentifier: `class`.defaultIdentifier(), for: indexPath) as! T
    }
    
    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(class: T.Type, kind: String, indexPath: IndexPath) -> T {
        return base.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: `class`.defaultIdentifier(), for: indexPath) as! T
    }
    
}
