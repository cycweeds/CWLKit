//
//  Stack.swift
//  CWLKit
//
//  Created by cyc on 2018/11/13.
//

import Foundation


public struct Stack<T> {
    private var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public var top: T? {
        return array.last
    }
}


extension Stack: Sequence {
    public func makeIterator() -> AnyIterator<T> {
        // create a new stack 
        var other = self
        return AnyIterator {
            return other.pop()
        }
    }
}
