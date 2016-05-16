//
//  DateCalculatorTest.swift
//  DateCalculatorTest
//
//  Created by Lubor Kolacny on 16/05/2016.
//  Copyright © 2016 Lubor Kolacny. All rights reserved.
//

import XCTest

class DateCalculatorTest: XCTestCase {
    
    func testLeapYears() {
        XCTAssert(Date.leapYear(1996))
        XCTAssert(Date.leapYear(2000))
    }
    
    func testNotLeapYears() {
        XCTAssert(!Date.leapYear(2500))
    }
    
    func testGreater() {
        do {
            let first = try Date(year: 2000, month: 2, day: 2)
            let second = try Date(year: 2000, month: 2, day: 1)
            XCTAssert(first > second)
        } catch {
            XCTFail()
        }
    }
    
}
