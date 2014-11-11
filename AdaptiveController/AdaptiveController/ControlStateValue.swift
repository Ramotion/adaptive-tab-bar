//
//  ControlState.swift
//  AdaptiveController
//
//  Created by Arcilite on 16.10.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit

extension UIControlState : Hashable {
    
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

    public var hashValue: Int {
     return Int(self.rawValue)
    }
    
//    func getStringKey()->String{
//        switch(self){
//            case UIControlState.Normal: return "UIControlStateNormal"
//            case UIControlState.Highlighted: return "UIControlStateHighlighted"
//            case UIControlState.Selected: return "UIControlStateSelected"
//            default: return "None"
//        }
//    
//    }
//    
//    public static func controlStateForString(string:String) ->UIControlState{
//        switch(string){
//            case "UIControlStateNormal" : return UIControlState.Normal
//            case "UIControlStateHighlighted": return  UIControlState.Highlighted
//            case"UIControlStateHighlighted": return  UIControlState.Selected
//            default: return UIControlState.Disabled
//        }
//        
//    }
}

func ==(lhs: UIControlState, rhs: UIControlState) -> Bool{
    return lhs.rawValue == rhs.rawValue
}



public class ControlStateValue:ControlStateProtocol{
   
   
    
    public typealias StateObject = ControlStateAppearance
    public typealias DictionaryObject = Dictionary <String,AnyObject>
    
    public var controlStates = Dictionary <String,ControlStateAppearance>()
  
  /*  private var contolStatesMappingDictionary = [((UIControlState.Normal).rawValue):"UIControlStateNormal",
                                                ((UIControlState.Highlighted).rawValue):"UIControlStateHighlighted",
                                                ((UIControlState.Selected).rawValue):"UIControlStateSelected"]
    */
    public  init(){
      //  self.init()
          self.controlStates = Dictionary<String,ControlStateAppearance>()
    }
    
    public convenience init(valueForNormalState:ControlStateAppearance) {
        self.init()
        
      //  self.setControlApearence(valueForNormalState, state: UIControlState.Normal)
       // self.setControlApearence(valueForNormalState, state: UIControlState.Highlighted)
       // self.setControlApearence(valueForNormalState, state: UIControlState.Selected)
        
    }
    
    public convenience init(styleValueStates:ControlStateValue) {
        self.init()
    
        for (state, object) in styleValueStates.controlStates {
             self.controlStates.updateValue( ControlStateAppearance(appearanceStyle: object), forKey: state)
        }
      //  self.setControlApearence(valueForNormalState!, state: UIControlState.Normal)
   
    }
    
    public func getObjectDictionary() -> Dictionary<String,DictionaryObject>{
        
        var controlStatesDictionary =   Dictionary<String,DictionaryObject>()
        
        for (key,object ) in controlStates{
            var appearance = object as ControlStateAppearance
            var appearanceDictionary =  appearance.getObjectDictionary()
            
            controlStatesDictionary.updateValue(appearanceDictionary, forKey:key)
        }
        
        return controlStatesDictionary
    }
    
  
    public func setObjectDictionary(dictionary:Dictionary <String,DictionaryObject>){
        
        for (key,object ) in dictionary{
            var appearanceDictionary = object as Dictionary <String,AnyObject>
            var appearanceObject = ControlStateAppearance()
            appearanceObject.setObjectDictionary(appearanceDictionary)
           // var valueKey = contolStatesMappingDictionary.к
           controlStates.updateValue(appearanceObject, forKey: key)
        }
    }
    
//   public func setControlApearence(appearance:ControlStateAppearance,state:UIControlState){
//        
//        var stateKey = "\(state.rawValue)"
//        var mapedKey = contolStatesMappingDictionary[stateKey]
//        self.controlStates.updateValue(appearance, forKey: mapedKey!)
//    
//    }
//    
//    public func getControlApearenceFor(state:UIControlState) -> ControlStateAppearance!{
//        
//      var stateKey:String = "\(state.rawValue)"
//      var mapedKey = contolStatesMappingDictionary[stateKey]
//      var stateObject =  self.controlStates[mapedKey!]
//      return stateObject
//    }

   
}
