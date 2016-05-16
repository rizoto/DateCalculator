//
//  Date.swift
//  DateCalculator
//
//  Created by Lubor Kolacny on 16/05/2016.
//  Copyright © 2016 Lubor Kolacny. All rights reserved.
//

struct Date {

    let daysInMonths = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

    let dayOfYear = [0, 0,
        31,
        31 + 28,
        31 + 28 + 31,
        31 + 28 + 31 + 30,
        31 + 28 + 31 + 30 + 31,
        31 + 28 + 31 + 30 + 31 + 30,
        31 + 28 + 31 + 30 + 31 + 30 + 31,
        31 + 28 + 31 + 30 + 31 + 30 + 31 + 31,
        31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30,
        31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31,
        31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30,
        31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30 + 31]
    
    
    let year, month, day : Int
    
    init(dateString: String) throws {
        let components = dateString.componentsSeparatedByString("-")
        try self.init(year: Int(components[0]) ?? 0, month: Int(components[1]) ?? 0, day: Int(components[2]) ?? 0)
    }
    
    init(year : Int, month : Int, day : Int) throws {
        
        self.year = year
        self.month = month
        self.day = day
        
        // validation
        if year == 0 || month == 0 || day == 0 {
            throw DateValidationError.InvalidDate
        } else if year < 1901 || year > 2999 {
            throw DateValidationError.OutOfRange
        } else if Date.leapYear(year) && month == 2 && day > 29 {
            throw DateValidationError.InvalidDate
        } else if month > 12 || daysInMonths[month] < day {
            throw DateValidationError.InvalidDate
        }
    }
    
}

extension Date {
    
    static func leapYear(year: Int) -> Bool {
        return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
    }

}

enum DateValidationError : ErrorType {
    case InvalidDate
    case OutOfRange
}