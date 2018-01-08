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

    public convenience init(installDate: Date, currentDate: Date, countDaysToSmallTextState: Int, countDaysToImageState: Int) {
        self.init()

        let remainsDays = daysBetweenDates(installDate: installDate, currentDate: currentDate)
        currentItemState = stateRemainDays(remainDays: remainsDays, countDaysToSmallTextState: countDaysToSmallTextState, countDaysToImageState: countDaysToImageState)
    }

    func daysBetweenDates(installDate: Date, currentDate: Date) -> Int {
        let units = Set<Calendar.Component>([.day])
        let components = NSCalendar.current.dateComponents(units, from: installDate, to: currentDate)
        return (components.day ?? 0) + 1
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
