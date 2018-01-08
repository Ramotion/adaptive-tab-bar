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

    public override init() {
        super.init()
        super.addNewCustomAdaptiveStates(customAdaptiveStates: [kSmallTitleAdaptiveState, kImageAdaptiveState])
    }

    public convenience init(installDate: NSDate, currentDate: NSDate, countDaysToSmallTextState: Int, countDaysToImageState: Int) {
        self.init()

        let remainsDays = daysBetweenDates(installDate: installDate, currentDate: currentDate)
        currentItemState = stateRemainDays(remainDays: remainsDays, countDaysToSmallTextState: countDaysToSmallTextState, countDaysToImageState: countDaysToImageState)
    }

    func daysBetweenDates(installDate: NSDate, currentDate: NSDate) -> Int {
        let calendar = NSCalendar.current
        let unit: NSCalendar.Unit = NSCalendar.Unit.day
        let components = calendar.components(unit, fromDate: installDate, toDate: currentDate, options: nil)
        return components.day + 1
    }

    func stateRemainDays(remainDays: Int, countDaysToSmallTextState: Int, countDaysToImageState: Int) -> String {
        var mode: String = kDefaultAdaptiveState
        if remainDays > countDaysToSmallTextState && remainDays < countDaysToImageState {
            mode = kSmallTitleAdaptiveState
        } else if remainDays > countDaysToImageState {
            mode = kImageAdaptiveState
        }
        return mode
    }
}
