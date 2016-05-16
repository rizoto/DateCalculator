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
        } else if month > 12 || (!Date.leapYear(year) && daysInMonths[month] < day) {
            throw DateValidationError.InvalidDate
        }
    }
    
}

func > (left: Date, right: Date) -> Bool {
    
    if  left.year > right.year {
        
        return true
        
    } else if left.year == right.year {
        
        if  left.month > right.month {
            
            return true
            
        } else if  left.month == right.month && left.day > right.day {
            
            return true
        }
    }
    return false
}

func < (left: Date, right: Date) -> Bool {
    return right > left
}

extension Date {
    
    static func leapYear(year: Int) -> Bool {
        return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
    }
    
    static func leapYearFebCorrectionSameYear(first: Date, second:Date) -> Int {
        if !Date.leapYear(first.year) {
            return 0
        }
        let date = try! Date(year: second.year, month: 2, day: 29)
        return first < date  && second > date ? 1 : 0
    }

}

extension Date {
    
    func daysBetween(date: Date) -> Int {
        
        // self - first, date - second
        let days: Int
        
        if  self.year == date.year {
            
            // add one day if 29/2 is between
            days = (dayOfYear[date.month] + date.day) - (dayOfYear[self.month] + self.day) + Date.leapYearFebCorrectionSameYear(self, second: date)
            
        } else {
            
            // first till 31/12 of the "first year"
            let firstDays = try! (365 + Date.leapYearFebCorrectionSameYear(self, second: Date(year:self.year, month:12, day:31))) - (dayOfYear[self.month] + self.day)
            
            // second from 1/1 of the "second" year
            let secondDays = try! (dayOfYear[date.month] + date.day) + Date.leapYearFebCorrectionSameYear(Date(year:date.year, month:1, day:1), second: date)
            
            // years in the middle
            var daysFromYearsBetween = 0
            var year = self.year + 1
            while year < date.year {
                daysFromYearsBetween += 365 + (Date.leapYear(year) ? 1 : 0)
                year++
            }
            
            days = firstDays + secondDays + daysFromYearsBetween
            
        }
        return days - 1
    }
    
}

enum DateValidationError : ErrorType {
    case InvalidDate
    case OutOfRange
}