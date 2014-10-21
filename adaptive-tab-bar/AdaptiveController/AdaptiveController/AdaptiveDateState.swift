//
//  AdaptiveDateState.swift
//  AdaptiveTabBarControllerSample
//
//  Created by Arcilite on 18.09.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit

public let kSmallTitleAdaptiveState = "kImageAdaptiveState"
public let kImageAdaptiveState = "kNormalImageAdaptiveState"

public class AdaptiveDateState: AdaptiveState {
   
    
    public override init(){
        super.init()
        super.addNewCustomAdaptiveStates([kSmallTitleAdaptiveState,kImageAdaptiveState])
    }
    
   public convenience init(installDate:NSDate, currentDate:NSDate,countDaysToSmallTextState:Int,countDaysToImageState:Int) {
        self.init()
        
        var remainsDays = self.daysBetweenDates(installDate,currentDate: currentDate)
        self.currentItemState =  self.stateRemainDays(remainsDays,countDaysToSmallTextState:countDaysToSmallTextState,countDaysToImageState:countDaysToImageState)
        print(currentItemState)
    }
    
    
     func daysBetweenDates(installDate:NSDate, currentDate:NSDate) -> Int{
        
        let cal = NSCalendar.currentCalendar()
        
        let unit:NSCalendarUnit = .DayCalendarUnit
        
        let components = cal.components(unit, fromDate: installDate, toDate: currentDate, options: nil)
        
        return components.day+1;
    }
    
     func stateRemainDays (remainDays:Int,countDaysToSmallTextState:Int,countDaysToImageState:Int)->String{
        
        var mode:String = kDefaultAdaptiveState
        print(" DAYS \(remainDays) ")
        if remainDays > countDaysToSmallTextState && remainDays < countDaysToImageState{
            mode = kSmallTitleAdaptiveState
        }else if remainDays > countDaysToImageState {
            mode = kImageAdaptiveState
        }
        print(mode)
        return mode
    }
}
