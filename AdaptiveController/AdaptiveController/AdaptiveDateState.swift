//
//  AdaptiveDateState.swift
//  AdaptiveTabBarControllerSample
//
//  Created by Arcilite on 18.09.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit

public let kSmallTitleAdaptiveState = "kSmallTitleAdaptiveState"
public let kImageAdaptiveState = "kImageAdaptiveState"

public class AdaptiveDateState: AdaptiveState {
   
    
   public convenience init(installDate:NSDate, currentDate:NSDate,countDaysToSmallTextState:Int,countDaysToImageState:Int) {
        self.init()
        
        var remainsDays = self.daysBetweenDates(installDate,currentDate: currentDate)
        self.currentItemState =  self.stateRemainDays(remainsDays,countDaysToSmallTextState:countDaysToSmallTextState,countDaysToImageState:countDaysToImageState)
      
    }
    
    
     func daysBetweenDates(installDate:NSDate, currentDate:NSDate) -> Int{
        
        let cal = NSCalendar.currentCalendar()
        
        let unit:NSCalendarUnit = .DayCalendarUnit
        
        let components = cal.components(unit, fromDate: installDate, toDate: currentDate, options: nil)
        
        return components.day+1;
    }
    
     func stateRemainDays (remainDays:Int,countDaysToSmallTextState:Int,countDaysToImageState:Int)->StateType{
        
        var mode:StateType = .DefaultAdaptiveState
        
        if remainDays > countDaysToSmallTextState && remainDays < countDaysToImageState{
            mode = .SmallTitleAdaptiveState
        }else if remainDays > countDaysToImageState {
            mode = .ImageAdaptiveState
        }
        
        return mode
    }
    
   
    
}
