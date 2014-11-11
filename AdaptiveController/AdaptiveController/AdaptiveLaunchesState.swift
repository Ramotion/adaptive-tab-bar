//
//  AdaaptiveLaunchesState.swift
//  AdaptiveController
//
//  Created by Arcilite on 04.10.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//


import UIKit

typealias StateType = AdaptiveStateEnum

public class AdaptiveLaunchesState : AdaptiveState {

    
    typealias StateType = AdaptiveStateEnum
   
    
    override init(){

    }
    
    
    public convenience init(curentCountLaunches:Int,countLaunchesToSmallTextState:Int,countLaunchesToImageState:Int){
        self.init()
    
        self.currentItemState = stateRemainDays(curentCountLaunches,countLaunchesToSmallTextState: countLaunchesToSmallTextState,countLaunchesToImageState: countLaunchesToImageState);
        
    }
    
    internal func stateRemainDays (curentCountLaunches:Int,countLaunchesToSmallTextState:Int,countLaunchesToImageState:Int)->StateType{
        var mode:StateType = .DefaultAdaptiveState
        
        if curentCountLaunches > countLaunchesToSmallTextState && curentCountLaunches < countLaunchesToImageState{
            mode = .SmallTitleAdaptiveState
        }else if curentCountLaunches > countLaunchesToImageState {
            mode = .ImageAdaptiveState
        }
        
        return mode;
    }
   
}
