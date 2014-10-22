//
//  ControlState.swift
//  AdaptiveController
//
//  Created by Arcilite on 16.10.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit



public class ControlStateValue:ControlStateProtocol{
   
    public typealias stateType = ControlStateAppearance
    
    public var normalState: stateType?
    public var selectedState: stateType?
    public var highlightedState: stateType?


    public convenience init(valueForNormalState:stateType?) {
       self.init()
       
       self.normalState = valueForNormalState
       self.selectedState = valueForNormalState
       self.highlightedState = valueForNormalState
   
    }
   
}
