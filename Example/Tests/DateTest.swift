//
//  DateTest.swift
//  Tests
//
//  Created by cyc on 6/17/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//


import CWLKit
import XCTest


class DateTest: XCTestCase {
    
    
    func testDateFormatter() {
        XCTAssertNotNil(DateFormatter.style1.date(from: "1991-10-15 10:09:08"))
        XCTAssertNotNil(DateFormatter.style2.date(from: "1991-10-15"))
        XCTAssertNotNil(DateFormatter.styleISO8601.date(from: "1991-10-15T10:09:08"))
        XCTAssertNotNil(DateFormatter.styleISO8601.date(from: "1991-10-15T10:09:08"))
    }
    
    
    func testDateCompoent() {
        
        let string = "1991-10-15T10:09:08"
        let testDate = DateFormatter.styleISO8601.date(from: string)!
        XCTAssert(testDate.year == 1991)
        XCTAssert(testDate.month == 10)
        XCTAssert(testDate.day == 15)
        XCTAssert(testDate.hour == 10)
        XCTAssert(testDate.minute == 9)
        XCTAssert(testDate.second == 8)
    }
    
    func testDateInterval() {
        
        let oneDayTimeInterval: TimeInterval = 3600 * 24
        
        let today = Date()
        XCTAssert(today.isToday)
        
        XCTAssert(today.addingTimeInterval(oneDayTimeInterval).isTomorrow)
        
        XCTAssert(today.addingTimeInterval(-oneDayTimeInterval).isYesterday)
        
        //        测试通过  随着时间修改这个会变动就注释掉
        //        XCTAssertFalse(today.isInWeekend)
        //        XCTAssert(today.addingTimeInterval(2 * oneDayTimeInterval).isInWeekend)
        //        XCTAssert(today.addingTimeInterval(3 * oneDayTimeInterval).isInWeekend)
        //        XCTAssertFalse(today.addingTimeInterval(7 * oneDayTimeInterval).isInWeekend)
        
        
        XCTAssert(today.isInCurrentMonth)
        XCTAssertFalse(today.addingTimeInterval(31 * oneDayTimeInterval).isInCurrentMonth)
        
        
        XCTAssert(today.isInCurrentYear)
        XCTAssertFalse(today.addingTimeInterval( 365 * 31 * oneDayTimeInterval).isInCurrentMonth)
    }
    
    
    
    
}
