//
//  AdaptiveController.swift
//  AdaptiveTabBarControllerSample
//
//  Created by Arcilite on 17.09.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit
enum TabBarItemState: Int {
    case DefaultTabBarItemState = 1, SmallTextModeTabBarItemState, ImageModeTabBarItemState
}

class AdaptiveController: NSObject {
   
    var currentTabBarItemState:TabBarItemState?
    
    convenience init(installDate:NSDate, currentDate:NSDate,countDaysToSmallTextState:Int,countDaysToImageState:Int) {
        self.init()
        
       var remainsDays = self.daysBetweenDates(installDate,currentDate: currentDate)
       self.currentTabBarItemState =  self.tabModeForRemainDays(remainsDays,countDaysToSmallTextState:countDaysToSmallTextState,countDaysToImageState:countDaysToImageState)
    }
    
    
   private func daysBetweenDates(installDate:NSDate, currentDate:NSDate) -> Int{
        
        let cal = NSCalendar.currentCalendar()
        
        let unit:NSCalendarUnit = .DayCalendarUnit
        
        let components = cal.components(unit, fromDate: installDate, toDate: currentDate, options: nil)
        
        return components.day+1;
    }
    
    private func tabModeForRemainDays (remainDays:Int,countDaysToSmallTextState:Int,countDaysToImageState:Int)->TabBarItemState{
        
        var mode:TabBarItemState = .DefaultTabBarItemState
        
        if remainDays > countDaysToSmallTextState && remainDays < countDaysToImageState{
            mode = .SmallTextModeTabBarItemState
        }else if remainDays > countDaysToImageState {
            mode = .ImageModeTabBarItemState
        }
        
        return mode
    }
    
}
