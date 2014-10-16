//
//  ControlStateProtocol.swift
//  AdaptiveController
//
//  Created by Arcilite on 16.10.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import Foundation

protocol ControlStateProtocol {
    
    typealias StateEnum
    
    var normalState: StateEnum?{get set}
    var selectedState: StateEnum?{get set}
    var highlightedState: StateEnum?{get set}
    
}