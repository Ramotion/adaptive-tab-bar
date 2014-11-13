//
//  ControlState.swift
//  AdaptiveController
//
//  Created by Arcilite on 16.10.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit

extension UIControlState   {
    
    init(string:StringLiteralType){
        switch(string){
                        case "UIControlStateNormal" :
                            self = UIControlState.Normal
                        case "UIControlStateHighlighted":
                            self =  UIControlState.Highlighted
                        case"UIControlStateHighlighted":
                            self =  UIControlState.Selected
                        default:
                            self = UIControlState.Disabled
                  }
    }

    func getStringKey()->String{
        switch(self){
            case UIControlState.Normal: return "UIControlStateNormal"
            case UIControlState.Highlighted: return "UIControlStateHighlighted"
            case UIControlState.Selected: return "UIControlStateSelected"
            default: return "None"
        }
    
    }
    

}



public class ControlStateValue:ControlStateProtocol{
   
   
    public typealias ControlStateType = UInt
   
    public typealias StateObject = ControlStateAppearance
    public typealias DictionaryObject = Dictionary <String,AnyObject>
    
    public var controlStates :Dictionary <ControlStateType,ControlStateAppearance>
  
     public  init(){
         self.controlStates = Dictionary<ControlStateType,ControlStateAppearance>()
    }
    
    public convenience init(values:Dictionary<ControlStateType,ControlStateAppearance>) {
        self.init()
        controlStates = values
        
    }
    
  
    public convenience init(styleValueStates:ControlStateValue) {
        self.init()
    
        for (state, object) in styleValueStates.controlStates {
             self.controlStates.updateValue( ControlStateAppearance(appearanceStyle: object), forKey: state)
        }
   
    }
    
    public func getObjectDictionary() -> Dictionary<String,DictionaryObject>{
        
        var controlStatesDictionary =   Dictionary<String,DictionaryObject>()
        
        for (key,object ) in controlStates{
            var appearance = object as ControlStateAppearance
            var appearanceDictionary =  appearance.getObjectDictionary()
            let controlKey = UIControlState(key).getStringKey()
            controlStatesDictionary.updateValue(appearanceDictionary, forKey:controlKey )
        }
        
        return controlStatesDictionary
    }
    
  
    public func setObjectDictionary(dictionary:Dictionary <String,DictionaryObject>){
        var controlStatesDictionary =   Dictionary<ControlStateType,ControlStateAppearance>()
        for (key,object ) in dictionary{
            var appearanceDictionary = object as Dictionary <String,AnyObject>
            var appearanceObject = ControlStateAppearance()
            appearanceObject.setObjectDictionary(appearanceDictionary)
            controlStatesDictionary.updateValue(appearanceObject, forKey: UIControlState(string:key).rawValue)
        }
    }
    

   
}
