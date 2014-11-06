//
//  AdaptiveButtonApperance.swift
//  AdaptiveTabBarControllerSample
//
//  Created by Arcilite on 18.09.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit

public let defaultFont = UIFont(name: "Helvetica", size: 14.0)
public let kNotTitle = ""
public class AdaptiveButtonAppearance: NSObject,AppearanceSerializationProtocol {
    

    public typealias StateObject = ControlStateValue
    public typealias DictionaryObject = Dictionary <String,AnyObject>
    
    
    private var stateDictionary:Dictionary <String,ControlStateValue> = Dictionary<String,ControlStateValue>()
    
   
    
    
    
    public func setAllCommonApperanceFrom(adaptiveButtonApperance:AdaptiveButtonAppearance){
        
        for (state, object) in adaptiveButtonApperance.stateDictionary {
        
            self.stateDictionary.updateValue(ControlStateValue(styleValueStates: object), forKey: state)
        }
        
    }
    
    
    public func setImageNamesForStatesImageExtesions(imageName :String ,imageExtensionsForState:Dictionary <String,String>){
        
        setImageNamesForStatesImageExtesions(imageName, imageExtensionsForState: imageExtensionsForState, controlState:UIControlState.Normal)
        
        setImageNamesForStatesImageExtesions(imageName, imageExtensionsForState: imageExtensionsForState, controlState:UIControlState.Highlighted)
        
        setImageNamesForStatesImageExtesions(imageName, imageExtensionsForState: imageExtensionsForState, controlState:UIControlState.Selected)
        
    }
    
    public func setImageNamesForStatesImageExtesions(imageName :String ,imageExtensionsForState:Dictionary <String,String>, controlState:UIControlState) {
        
        self.setButtonImage(UIImage(named: imageName)!, state: kDefaultAdaptiveState)
        for (state,imageExtension) in imageExtensionsForState {
            self.setButtonImage(UIImage(named: imageName+imageExtension)!, state: state ,controlState:controlState)
            self.setButtonImageName(imageName,state: state ,controlState:controlState)
        }
        
    }
    
    func getStateObjectForState(state:String) -> ControlStateValue!{
        if let stateObject = stateDictionary[state] {
            return stateObject
        }else{
            return nil
        }
    }
    
    func getOrCreateStateObjectForState(state:String) -> ControlStateValue!{
        if let stateObject = stateDictionary[state] {
            return stateObject
        }else{
                var stateObject = ControlStateValue()
                stateDictionary.updateValue(stateObject, forKey: state)
                return stateObject
        }
    }
    
    
    
    func getOrCreateStateAppearenceObject(controlStateValueObject:ControlStateValue, controlState:UIControlState)->ControlStateAppearance{
        
        if let stateObject =  controlStateValueObject.getControlApearenceFor(controlState) {
           
            return stateObject
        }else{
            if let stateObject =  controlStateValueObject.getControlApearenceFor(UIControlState.Normal) {
                controlStateValueObject.setControlApearence(stateObject,state: controlState)
                return stateObject
            }else{
                var stateObject = ControlStateAppearance()
                stateObject.titleColor = nil
                stateObject.title = nil
                controlStateValueObject.setControlApearence(stateObject,state: controlState)
                return stateObject
            }
            
        }
    }
    
    
    
    public  func setButonTitle(title:NSString, state:String){
        setButonTitle(title, state:state, controlState:UIControlState.Normal)
    }
    
    public func getButonTitleForState(state:NSString)->String!{
        return getButonTitleForState(state, controlState: UIControlState.Normal)
    }
    
    public  func setButonTitle(title:NSString, state:String, controlState:UIControlState){
        
        var controlStateValueObject = getOrCreateStateObjectForState(state)
        var controlStateAppearanceObject = getOrCreateStateAppearenceObject(controlStateValueObject,controlState: controlState)
        controlStateAppearanceObject.title = title

    }
    
    public func getButonTitleForState(state:NSString ,controlState:UIControlState)->String!{
        
        var controlStateValueObject = getOrCreateStateObjectForState(state)
        var controlStateAppearanceObject = controlStateValueObject.getControlApearenceFor(controlState)
       
        if let title = controlStateAppearanceObject.title{
            return title
        }else{
            var controlStateValueObject = getOrCreateStateObjectForState(kDefaultAdaptiveState)
            var controlStateAppearanceObject = controlStateValueObject.getControlApearenceFor(controlState)
            return controlStateAppearanceObject.title!
        }
        
       
    }
    

    
    public func setButonTitleFontForState(font:UIFont, state:String){
        setButonTitleFont(font, state: state, controlState: UIControlState.Normal)
    }
    
    public func getButonTitleFontForState(state:NSString)->UIFont{
        
        if let font =  getButonTitleFontForState(state, controlState: UIControlState.Normal){
            return font
        }else{
            return defaultFont!
        }
    
    }
    
    
    public func getButonTitleFontForState(state:NSString ,controlState:UIControlState)->UIFont!{
        var controlStateValueObject = getOrCreateStateObjectForState(state)
        let controlStateAppearanceObject = controlStateValueObject.getControlApearenceFor(controlState)
        return controlStateAppearanceObject.font!
            
    }
    
    public  func setButonTitleFont(font:UIFont, state:String, controlState:UIControlState){
        
        var controlStateValueObject = getOrCreateStateObjectForState(state)
        var controlStateAppearanceObject = getOrCreateStateAppearenceObject(controlStateValueObject,controlState: controlState)
        controlStateAppearanceObject.font = font
       
    }
    
    
    public func setButtonImage(image:UIImage, state:String){
       
        setButtonImage(image, state: state, controlState: UIControlState.Normal)
        print("set State \(state)")
    }
    
   
    
    public func setButtonImage(image:UIImage, state:String, controlState:UIControlState){
        
        var controlStateValueObject = getOrCreateStateObjectForState(state)
        var controlStateAppearanceObject = getOrCreateStateAppearenceObject(controlStateValueObject,controlState: controlState)
        controlStateAppearanceObject.image = image
        
        print("set State \(state)")
    }

    public func setButtonImageName(imageName:String, state:String){
        
        setButtonImageName(imageName, state: state, controlState: UIControlState.Normal)
        print("set State \(state)")
    }
 
    public func setButtonImageName(imageName:String, state:String, controlState:UIControlState){
        
        var controlStateValueObject = getOrCreateStateObjectForState(state)
        var controlStateAppearanceObject = getOrCreateStateAppearenceObject(controlStateValueObject,controlState: controlState)
        controlStateAppearanceObject.imageName = imageName
        
        print("set State \(state)")
    }

    
    public func getButonImageForState(state:NSString)->UIImage!{
       
        return getButonImageForState(state, controlState: UIControlState.Normal)
        
    }
    
    public func getButonImageForState(state:NSString, controlState:UIControlState)->UIImage?{
        var controlStateValueObject = getOrCreateStateObjectForState(state)
        
         if var controlStateAppearanceObject = controlStateValueObject.getControlApearenceFor(controlState){
            if let image =  controlStateAppearanceObject.image{
                return image
            }else{
                var controlStateValueObject = getOrCreateStateObjectForState(kDefaultAdaptiveState)
                var controlStateAppearanceObject = controlStateValueObject.getControlApearenceFor(controlState)
                return controlStateAppearanceObject.image!
            }
            
        }else{
            return nil
        }
    }
    
    
    public func getButonImageNameForState(state:NSString)->NSString!{
        
        return getButonImageNameForState(state, controlState: UIControlState.Normal)
        
    }
    
    public func getButonImageNameForState(state:NSString, controlState:UIControlState)->NSString?{
        var controlStateValueObject = getOrCreateStateObjectForState(state)
        
        if var controlStateAppearanceObject = controlStateValueObject.getControlApearenceFor(controlState){
            return controlStateAppearanceObject.imageName
        }else{
            return nil
        }
    }
    
    public func setBackgroundButonImage(image:UIImage, state:String){
      
        setBackgroundButonImage(image, state: state)
    }
    
    public func setBackgroundButtonImage(image:UIImage, state:String, controlState:UIControlState){
       
        var controlStateValueObject = getOrCreateStateObjectForState(state)
        var controlStateAppearanceObject = getOrCreateStateAppearenceObject(controlStateValueObject,controlState: controlState)
        controlStateAppearanceObject.backgroundImage = image
        
        print("set State \(state)")
    }
    
    public func getBackgroundImageForState(state:NSString)->UIImage?{
      
        return getBackgroundButonImageForState(state, controlState: UIControlState.Normal)
        
    }
    
    public func getBackgroundButonImageForState(state:NSString, controlState:UIControlState)->UIImage?{
        var controlStateValueObject = getOrCreateStateObjectForState(state)
        
        if var controlStateAppearanceObject = controlStateValueObject.getControlApearenceFor(controlState){
            if let image =  controlStateAppearanceObject.backgroundImage{
                return image
            }else{
                var controlStateValueObject = getOrCreateStateObjectForState(kDefaultAdaptiveState)
                var controlStateAppearanceObject = controlStateValueObject.getControlApearenceFor(controlState)
                return controlStateAppearanceObject.backgroundImage!
            }

        }else{
            return nil
        }
    }
    
    
    public func setImageInsets(insets:UIEdgeInsets, state:String){
        setImageInsets(insets, state: state,controlState:UIControlState.Normal)
    }
    
    
    public func setImageInsets(insets:UIEdgeInsets, state:String, controlState:UIControlState){
        var controlStateValueObject = getOrCreateStateObjectForState(state)
        var controlStateAppearanceObject = getOrCreateStateAppearenceObject(controlStateValueObject,controlState: controlState)
        controlStateAppearanceObject.imageInsets = insets
    }
    
    public func getImageInsetsForState(state:NSString)->UIEdgeInsets!{
        
        return getImageInsetsForState(state, controlState: UIControlState.Normal)

        
    }
    
    public func getImageInsetsForState(state:NSString ,controlState:UIControlState)->UIEdgeInsets!{
        
        var controlStateValueObject = getOrCreateStateObjectForState(state)
        
        var controlStateAppearanceObject = controlStateValueObject.getControlApearenceFor(controlState)
        return controlStateAppearanceObject.imageInsets!
        
    }
  
    
    public func setTitleOffset(offset:UIOffset, state:String){
        setTitleOffset(offset, state: state, controlState: UIControlState.Normal)
    }
    
    public func setTitleOffset(offset:UIOffset, state:String, controlState:UIControlState){
        var controlStateValueObject = getOrCreateStateObjectForState(state)
        var controlStateAppearanceObject = getOrCreateStateAppearenceObject(controlStateValueObject,controlState: controlState)
        controlStateAppearanceObject.titleOffset = offset
    }
    
    public func getTitleOffsetForState(state:NSString)->UIOffset!{
        return getTitleOffsetForState(state,controlState:UIControlState.Normal)
    }
    
    public func getTitleOffsetForState(state:NSString ,controlState:UIControlState)->UIOffset!{
        
        var controlStateValueObject = getOrCreateStateObjectForState(state)
        
        var controlStateAppearanceObject = controlStateValueObject.getControlApearenceFor(controlState)
        return controlStateAppearanceObject.titleOffset!
        
    }
    
    
    public func setTitleColor(color:UIColor, state:String){
        
        setTitleColor(color, state: state,controlState:UIControlState.Normal)
        setTitleColor(color, state: state,controlState:UIControlState.Highlighted)
        setTitleColor(color, state: state,controlState:UIControlState.Selected)
      
    }
    
    public func setTitleColor(color:UIColor, state:String, controlState:UIControlState){
        var controlStateValueObject = getOrCreateStateObjectForState(state)
        var controlStateAppearanceObject = getOrCreateStateAppearenceObject(controlStateValueObject,controlState: controlState)
        controlStateAppearanceObject.titleColor = color
    }
   
    
    public func getTitleColorForState(state:NSString)->UIColor!{
       return getTitleColorForState(state, controlState: UIControlState.Normal)

    }
    
    public func getTitleColorForState(state:NSString ,controlState:UIControlState)->UIColor!{
        
        var controlStateValueObject = getOrCreateStateObjectForState(state)
        var controlStateAppearanceObject = controlStateValueObject.getControlApearenceFor(controlState)
        
        if let curentTitleColor = controlStateAppearanceObject.titleColor{
            return curentTitleColor
        }else{
            var controlStateValueObject = getStateObjectForState(kDefaultAdaptiveState)
            println(controlStateValueObject)
            var controlStateAppearanceObject = controlStateValueObject.getControlApearenceFor(controlState)
            return controlStateAppearanceObject.titleColor!
        }
    
      
        
    }
    
    public func setObjectDictionary(dictionary:Dictionary <String,DictionaryObject>){
        
        for (key,object ) in dictionary{
            var appearanceDictionary = object as Dictionary <String,DictionaryObject>
            var appearanceObject = ControlStateValue()
            appearanceObject.setObjectDictionary(appearanceDictionary)
            stateDictionary.updateValue(appearanceObject, forKey: key)
        }
    }
    
    public func getObjectDictionary() -> Dictionary<String,DictionaryObject>{
        
        var controlStatesDictionary =   Dictionary<String,DictionaryObject>()
        
        for (key,object ) in stateDictionary{
            var appearance = object as ControlStateValue
            var appearanceDictionary =  appearance.getObjectDictionary()
            controlStatesDictionary.updateValue(appearanceDictionary, forKey: key)
        }
        
        return controlStatesDictionary
    }


}
