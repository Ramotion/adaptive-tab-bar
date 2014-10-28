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
    
    public var controlStates: Dictionary <String,ControlStateAppearance>?

    public convenience init(valueForNormalState:StateObject?) {
       self.init()
       self.controlStates = Dictionary<String,ControlStateAppearance>()
   
    }
    
    public func getObjectDictionary() -> Dictionary<String,StateObject>{
        
        return controlStates!
    }
    
   public func setObjectDictionary(dictionary:Dictionary<String,StateObject>){
        self.controlStates = dictionary
    }
    
   public func setControlApearence(appearance:ControlStateAppearance,state:UIControlState){
        
        var stateKey = "\(state.rawValue)"
        self.controlStates?.updateValue(appearance, forKey: stateKey)
        println(stateKey)
        
    }
    
    public func getControlApearenceFor(state:UIControlState) -> ControlStateAppearance{
        
      var stateKey:String = "\(state.rawValue)"
      var stateObject =  self.controlStates![stateKey]
      
     return stateObject!
    }

   
}
