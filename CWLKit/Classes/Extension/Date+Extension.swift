//
//  Date+Extension.swift
//  CWLKit
//
//  Created by cyc on 2018/11/8.
//

import Foundation

public extension Date {
    var year: Int {
        return Calendar.current.component(.year, from: self)
    }
    
    var month: Int {
        return Calendar.current.component(.month, from: self)
    }
    
    var day: Int {
        return Calendar.current.component(.day, from: self)
    }
    
    var hour: Int {
              return Calendar.current.component(Calendar.Component.hour, from: self)
          }
    
    var minute: Int {
        return Calendar.current.component(Calendar.Component.minute, from: self)
    }
   
    
    var second: Int {
        return Calendar.current.component(Calendar.Component.second, from: self)
    }
    
    var nanosecond: Int {
        return Calendar.current.component(Calendar.Component.nanosecond, from: self)
    }
    
    var weekday: Int {
        return Calendar.current.component(Calendar.Component.weekday, from: self)
    }
    
    var isToday: Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self) == formatter.string(from: Date())
    }
    
    var isYesterday: Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self) == formatter.string(from: Date(timeIntervalSinceNow: -60 * 60 * 24))
    }
}
