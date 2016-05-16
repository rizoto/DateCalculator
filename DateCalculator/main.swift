//
//  main.swift
//  DateCalculator
//
//  Created by Lubor Kolacny on 16/05/2016.
//  Copyright © 2016 Lubor Kolacny. All rights reserved.
//

import Foundation

if Process.argc != 3
{
    print("usage: DateCalculator 2001-01-01 2002-02-02")
}
else
{
    do {
        
        let first =  try Date(dateString: Process.arguments[1])
        let second =  try Date(dateString: Process.arguments[2])
        
        if first < second {
            print("\(Process.arguments[1]) - \(Process.arguments[2]): \(first.daysBetween(second)) days")
        } else if first > second {
            print("\(Process.arguments[1]) - \(Process.arguments[2]): \(second.daysBetween(first)) days")
        } else {
            print("\(Process.arguments[1]) - \(Process.arguments[2]): \(0) days")
        }
    
    } catch DateValidationError.OutOfRange {
        print("Out of Range \nusage: DateCalculator 2001-01-01 2002-02-02")
    } catch DateValidationError.InvalidDate {
        print("Invalid Dates \nusage: DateCalculator 2001-01-01 2002-02-02")
    }
}


