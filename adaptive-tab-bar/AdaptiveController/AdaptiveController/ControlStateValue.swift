//
//  ControlState.swift
//  AdaptiveController
//
//  Created by Arcilite on 16.10.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit



public class ControlStateValue:ControlStateProtocol{
   
    public typealias StateObject = ControlStateAppearance
    
    public var controlStates: Dictionary <String,StateObject>?

    public convenience init(valueForNormalState:StateObject?) {
       self.init()
       
   
    }
    
    func getObjectDictionary() -> Dictionary<String,AnyObject>{
        
        return controlStates!
    }
    
    func setObjectDictionary(dictionary:Dictionary<String,AnyObject>){
        //self.controlStates = dictionary
    }

   
}
