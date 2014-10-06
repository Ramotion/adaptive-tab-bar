//
//  TimeSettingsObject.swift
//  adaptive-tab-bar
//
//  Created by Arcilite on 16.09.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit

let twoWeaks:Int = 14
let month:Int = 31

enum TabMode: Int {
    case Default = 1, SmallTextMode, ImageMode
}

class TimeSettingsObject: NSObject {
  
    var DateFrom:NSDate?
    var DateTo:NSDate = NSDate()
    var periodToSmallTextMode = twoWeaks
    var periodToImageMode = month
    
    convenience init(startDate:NSDate) {
        self.init()
        self.DateFrom = startDate
        
    }
    
    func daysBetweenDates() -> Int{
        
        let cal = NSCalendar.currentCalendar()
        
        let unit:NSCalendarUnit = .DayCalendarUnit
        
        let components = cal.components(unit, fromDate: self.DateFrom!, toDate: self.DateTo, options: nil)
        
        return components.day+1;
    }
    
    func tabModeForElapsedTime ()->TabMode{
        var days = self.daysBetweenDates()
        var mode:TabMode = .Default
        
        if days > periodToSmallTextMode && days < periodToImageMode{
           mode = .SmallTextMode
        }else if days > periodToImageMode {
            mode = .ImageMode
        }
        
        return mode
    }
    
    

}
