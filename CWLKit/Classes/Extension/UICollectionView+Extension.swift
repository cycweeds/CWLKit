//
//  UICollectionView+Extension.swift
//  CWLKit
//
//  Created by cyc on 2018/11/8.
//

import Foundation


extension UICollectionView {
    public var cwl_totalRows: Int {
        let sectionCount = self.numberOfSections
        if sectionCount == 0 {
            return 0
        }
        
        var sum = 0
        for section in 0..<sectionCount {
            sum += self.numberOfItems(inSection: section)
        }
        return sum
    }
    
    public func cwl_registerCell<T: UICollectionViewCell>(class: T.Type) {
        let reuseIdentifier = String(describing: `class`)
        self.register(`class`, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    public func cwl_registerNibCell<T: UICollectionViewCell>(class: T.Type, nibBunlde: Bundle?) {
        let reuseIdentifier = String(describing: `class`)
        self.register(UINib(nibName: reuseIdentifier, bundle: nibBunlde), forCellWithReuseIdentifier: reuseIdentifier)
    }
    
}
