//
//  DateFormatter+Ex.swift
//  Pods
//
//  Created by cyc on 6/17/21.
//

import Foundation


/**
 dateFormat 格式大全
 https://www.unicode.org/reports/tr35/tr35-31/tr35-dates.html#Date_Field_Symbol_Table
 
 */


public extension DateFormatter {
    /// yyyy-MM-dd hh:mm:ss
    static var style1: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        return formatter
    }()
    
    /// yyyy-MM-dd
    static var style2: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    /// yyyy-MM-dd`T`hh:mm:ss
    static var styleISO8601: DateFormatter = {
        let formatter = DateFormatter()
         formatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss"
         return formatter
     }()
     
}
