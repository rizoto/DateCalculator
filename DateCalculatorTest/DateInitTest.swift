//
//  DateInitTest.swift
//  DateCalculator
//
//  Created by Lubor Kolacny on 16/05/2016.
//  Copyright © 2016 Lubor Kolacny. All rights reserved.
//

import XCTest

class DateInitTest: XCTestCase {

    func testValidDate() {
        do {
            let _ = try Date(dateString: "2000-01-01")
            XCTAssert(true)
        } catch {
            XCTFail()
        }
    }
    
    func testNotValidDateFebLeap() {
        do {
            let _ = try Date(dateString: "2000-02-30")
            XCTFail()
        } catch {
            XCTAssert(true)
        }
    }
    
    func testNotValidDateFebNotLeap() {
        do {
            let _ = try Date(dateString: "2001-02-29")
            XCTFail()
        } catch {
            XCTAssert(true)
        }
    }
    
    func testInvalidDate() {
        do {
            let _ = try Date(dateString: "2000-0x-01")
            XCTFail()
        } catch {
            XCTAssert(true)
        }
    }
    
    func testInvalidDateOutOfRange() {
        do {
            let _ = try Date(dateString: "3000-01-01")
            XCTFail()
        } catch {
            XCTAssert(true)
        }
    }

}
