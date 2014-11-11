//
//  ControlStateProtocol.swift
//  AdaptiveController
//
//  Created by Arcilite on 16.10.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import Foundation

protocol ControlStateProtocol:AppearanceSerializationProtocol {
    
    typealias StateType: Hashable
    typealias StateObject
    
    var controlStates: Dictionary <StateType, StateObject>{get set}
    
}