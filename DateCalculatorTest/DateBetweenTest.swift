//
//  DateBetweenTest.swift
//  DateCalculator
//
//  Created by Lubor Kolacny on 17/05/2016.
//  Copyright © 2016 Lubor Kolacny. All rights reserved.
//

import XCTest

class DateBetweenTest: XCTestCase {
    
    func testZero() {
        do {
            let first = try Date(year: 2000, month: 1, day: 1)
            let second = try Date(year: 2000, month: 1, day: 2)
            XCTAssertEqual(first.daysBetween(second), 0)
        } catch {
            XCTFail()
        }
    }
    
    func testOneDay() {
        do {
            let first = try Date(year: 2000, month: 2, day: 28)
            let second = try Date(year: 2000, month: 3, day: 1)
            XCTAssertEqual(first.daysBetween(second), 1)
        } catch {
            XCTFail()
        }
    }
    
    func testOneMonth() {
        do {
            let first = try Date(year: 1999, month: 11, day: 1)
            let second = try Date(year: 1999, month: 12, day: 2)
            XCTAssertEqual(first.daysBetween(second), 30)
        } catch {
            XCTFail()
        }
    }

    func testBetweenTwoDates() {
        do {
            let first = try Date(year: 1983, month: 6, day: 2)
            let second = try Date(year: 1983, month: 6, day: 22)
            XCTAssertEqual(first.daysBetween(second), 19)
        } catch {
            XCTFail()
        }
    }
    
    func testBetweenTwoDates1() {
        do {
            let first = try Date(year: 1984, month: 7, day: 4)
            let second = try Date(year: 1984, month: 12, day: 25)
            XCTAssertEqual(first.daysBetween(second), 173)
        } catch {
            XCTFail()
        }
    }
    
    func testBetweenTwoDates2() {
        do {
            let first = try Date(year: 1983, month: 8, day: 3)
            let second = try Date(year: 1989, month: 1, day: 3)
            XCTAssertEqual(first.daysBetween(second), 1979)
        } catch {
            XCTFail()
        }
    }

}
