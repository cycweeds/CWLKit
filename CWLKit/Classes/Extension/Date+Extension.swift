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
        return currentCalendar.isDateInToday(self)
    }
    
    var isYesterday: Bool {
        return currentCalendar.isDateInYesterday(self)
    }
    
    var isTomorrow: Bool {
        return currentCalendar.isDateInTomorrow(self)
    }
    
    /// 是否在周末
    var isInWeekend: Bool {
        return currentCalendar.isDateInWeekend(self)
    }
    
    var isInWorkDay: Bool {
        return !isInWeekend
    }
    
    var isInCurrentYear: Bool {
        return currentCalendar.isDate(self, equalTo: Date(), toGranularity: .year)
    }
    
    var isInCurrentMonth: Bool {
        return currentCalendar.isDate(self, equalTo: Date(), toGranularity: .month)
    }
    
    var isInCurrentWeek: Bool {
        return currentCalendar.isDate(self, equalTo: Date(), toGranularity: .weekOfYear)
    }
    
    var currentCalendar: Calendar {
        return Calendar.current
    }
    
    
}
