//
//  AdaptiveButtonApperance.swift
//  AdaptiveTabBarControllerSample
//
//  Created by Arcilite on 18.09.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit




public class AdaptiveButtonAppearance: AppearanceSerializationProtocol{
    

    public typealias StateObject = ControlStateValue
    public typealias DictionaryObject = Dictionary <String,AnyObject>
    public var stateDictionary:Dictionary <StateKey,ControlStateValue> = Dictionary <StateKey,ControlStateValue>()
    
    public init(){
        
    }
    
    public init (values:Dictionary<StateKey,ControlStateValue>) {
        stateDictionary = values

    }
    
    public convenience init(states:Dictionary<StateKey,ControlStateValue>) {
        
        self.init(values:states)
        
    }
    
    public func setObjectDictionary(dictionary:Dictionary <String,DictionaryObject>){
        
        var controlStatesDictionary =   Dictionary<StateKey,ControlStateValue>()
        
        for (key,object ) in dictionary{
            let appearanceDictionary = object as Dictionary <String,DictionaryObject>
            let appearanceObject = ControlStateValue()
            appearanceObject.setObjectDictionary(appearanceDictionary)
            controlStatesDictionary.updateValue(appearanceObject, forKey: StateKey(rawValue: key)!)
        }
        stateDictionary = controlStatesDictionary
    }
    
    public func getObjectDictionary() -> Dictionary<String,DictionaryObject>{
        
        var controlStatesDictionary =   Dictionary<String,DictionaryObject>()
        
        for (key,object ) in stateDictionary{
            let appearance = object as ControlStateValue
            let appearanceDictionary =  appearance.getObjectDictionary()
            controlStatesDictionary.updateValue(appearanceDictionary, forKey: key.rawValue)
        }
        
        return controlStatesDictionary
    }


}
