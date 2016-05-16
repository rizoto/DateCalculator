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
    
}
