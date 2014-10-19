//
//  AdaaptiveLaunchesState.swift
//  AdaptiveController
//
//  Created by Arcilite on 04.10.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//
public let countDaysForSmaltextState = 3
public let countDaysForImageModeState = 7

import UIKit

public class AdaptiveLaunchesState : AdaptiveState {
    
    public override init(){
        super.init()
        super.addNewCustomAdaptiveStates([kSmallTitleAdaptiveState,kImageAdaptiveState])
    }
    
    
    public convenience init(curentCountLaunches:Int,countLaunchesToSmallTextState:Int,countLaunchesToImageState:Int) {
        self.init()
        
        
        self.currentItemState = stateRemainDays(curentCountLaunches,countLaunchesToSmallTextState: countLaunchesToSmallTextState,countLaunchesToImageState: countLaunchesToImageState);
        
        //print(currentItemState)
    }
    
    internal func stateRemainDays (curentCountLaunches:Int,countLaunchesToSmallTextState:Int,countLaunchesToImageState:Int)->String{
        var mode:String = kDefaultAdaptiveState
        
        if curentCountLaunches > countLaunchesToSmallTextState && curentCountLaunches < countLaunchesToImageState{
            mode = kSmallTitleAdaptiveState
        }else if curentCountLaunches > countLaunchesToImageState {
            mode = kImageAdaptiveState
        }
        
        return mode;
    }
   
}
