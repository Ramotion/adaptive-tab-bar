//
//  DateExtension.swift
//  adaptive-tab-bar
//
//  Created by Arcilite on 16.09.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit

extension NSDate{
    convenience
    
    init(dateString:String) {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        let d = dateStringFormatter.dateFromString(dateString)
        self.init(timeInterval:0, sinceDate:d!)
    }
    
    func daysBetween(dayFrom:NSDate,dayTo:NSDate) -> Int{
        
        let cal = NSCalendar.currentCalendar()
        
        let unit:NSCalendarUnit = .DayCalendarUnit
        
        let components = cal.components(unit, fromDate: dayFrom, toDate: dayTo, options: nil)
        
        return components.day+1;
    }
    
}