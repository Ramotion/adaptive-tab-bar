//
//  ControlState.swift
//  AdaptiveController
//
//  Created by Arcilite on 16.10.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit

public enum ControlStateEnum {
    case ControlStateFont(UIFont), ControlStateImage(UIImage),ControlStateTitle(String),ControlStateInsets(UIEdgeInsets),ControlStateColor(UIColor),UIControlState(UIOffset)
}



public class ControlState:ControlStateProtocol{
   
    typealias StateEnum = ControlStateEnum
    
    public var normalState: StateEnum?
    public var selectedState: StateEnum?
    public var highlightedState: StateEnum?


    public convenience init(valueForNormalState:ControlStateEnum?) {
       self.init()
       
       self.valueForNormalState = valueForNormalState
       self.valueForHighlighttedState = valueForHighlightedState
       self.valueForSelectedState = valueForSelectedState
   
    }
   
}
