//
//  Date+Extension.swift
//  CWLKit
//
//  Created by cyc on 2018/11/8.
//

import Foundation

extension Date {
    public var year: Int {
        return Calendar.current.component(.year, from: self)
    }
    
    public var month: Int {
        return Calendar.current.component(.month, from: self)
    }
    
    public var day: Int {
        return Calendar.current.component(.day, from: self)
    }
    
    public var minute: Int {
        return Calendar.current.component(Calendar.Component.minute, from: self)
    }
    
    public var second: Int {
        return Calendar.current.component(Calendar.Component.second, from: self)
    }
    
    public var weekday: Int {
        return Calendar.current.component(Calendar.Component.weekday, from: self)
    }
    
    public var isToday: Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self) == formatter.string(from: Date())
    }
    
    public var isYesterday: Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self) == formatter.string(from: Date(timeIntervalSinceNow: -60 * 60 * 24))
    }
}
