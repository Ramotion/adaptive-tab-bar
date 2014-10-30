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
public class AdaptiveButtonAppearance: NSObject {
    

    private var butonsTitleForStateDictionary:Dictionary <String,String> = Dictionary<String,String>()
    private var butonsTitleFontForStateDictionary:Dictionary <String,UIFont> = Dictionary<String,UIFont>()
    private var buttonsImageForStateDictionary:Dictionary <String,UIImage> = Dictionary<String,UIImage>()
    private var buttonsBackgroundImageForStateDictionary:Dictionary <String,UIImage> = Dictionary<String,UIImage>()
    
    
    private var buttonsImageInsetsForStateDictionary:Dictionary <String,UIEdgeInsets> = Dictionary<String,UIEdgeInsets>()
    private var buttonsTitleInsetsForStateDictionary:Dictionary <String,UIOffset> = Dictionary<String,UIOffset>()
    
    private var buttonsTitleColorsForStateDictionary:Dictionary <String,UIColor> = Dictionary<String,UIColor>()
    
    
    private var stateDictionary:Dictionary <String,ControlStateValue> = Dictionary<String,ControlStateValue>()
    
    
   
    
    func setInsetsFromAdaptiveButtonApperance(adaptiveButtonApperance:AdaptiveButtonAppearance){
        
        self.buttonsImageInsetsForStateDictionary = adaptiveButtonApperance.buttonsImageInsetsForStateDictionary
        
        self.buttonsTitleInsetsForStateDictionary = adaptiveButtonApperance.buttonsTitleInsetsForStateDictionary
        
    
    }
    
    public func setFontsFromAdaptiveButtonApperance(adaptiveButtonApperance:AdaptiveButtonAppearance){
        
        self.butonsTitleFontForStateDictionary =  adaptiveButtonApperance.butonsTitleFontForStateDictionary
       
    }
    
    public func setAllCommonApperanceFrom(adaptiveButtonApperance:AdaptiveButtonAppearance){
        self.setInsetsFromAdaptiveButtonApperance(adaptiveButtonApperance)
        self.setFontsFromAdaptiveButtonApperance(adaptiveButtonApperance)
        self.buttonsTitleColorsForStateDictionary = adaptiveButtonApperance.buttonsTitleColorsForStateDictionary
       
        for (state, object) in adaptiveButtonApperance.stateDictionary {
        
            self.stateDictionary.updateValue(ControlStateValue(styleValueStates: object), forKey: state)
        }
        
    }
    
    
    public func setImageNamesForStatesImageExtesions(imageName :String ,imageExtensionsForState:Dictionary <String,String>){
        
         self.setButtonImage(UIImage(named: imageName)!, state: kDefaultAdaptiveState)
        for (state,imageExtension) in imageExtensionsForState {
           self.setButtonImage(UIImage(named: imageName+imageExtension)!, state: state)
        }
        
        
    }
    
    func getOrCreateStateObjectForState(state:String) -> ControlStateValue!{
        if let stateObject = stateDictionary[state] {
            return stateObject
        }else{
            var stateObject = ControlStateValue()
            if let stateDefaultObject = stateDictionary[kDefaultAdaptiveState]  {
                if state != kDefaultAdaptiveState {
                     stateObject = ControlStateValue(styleValueStates:stateDefaultObject)
                }
            }
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
       // butonsTitleForStateDictionary.updateValue(title, forKey:state)
    }
    
    public func getButonTitleForState(state:NSString ,controlState:UIControlState)->String!{
        
        var controlStateValueObject = getOrCreateStateObjectForState(state)
    
        var controlStateAppearanceObject = controlStateValueObject.getControlApearenceFor(controlState)
        return controlStateAppearanceObject.title!
       
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
        if  let controlStateAppearanceObject = controlStateValueObject.getControlApearenceFor(controlState){
            return controlStateAppearanceObject.font!
        }else{
            return defaultFont!
        }
    }
    
    public  func setButonTitleFont(font:UIFont, state:String, controlState:UIControlState){
        
        var controlStateValueObject = getOrCreateStateObjectForState(state)
        var controlStateAppearanceObject = getOrCreateStateAppearenceObject(controlStateValueObject,controlState: controlState)
        controlStateAppearanceObject.font = font
       
    }
    
    
    public func setButtonImage(image:UIImage, state:String){
       // buttonsImageForStateDictionary.updateValue(image, forKey:state)
        setButtonImage(image, state: state, controlState: UIControlState.Normal)
        print("set State \(state)")
    }
    
    public func setButtonImage(image:UIImage, state:String, controlState:UIControlState){
        //buttonsImageForStateDictionary.updateValue(image, forKey:state)
        var controlStateValueObject = getOrCreateStateObjectForState(state)
        var controlStateAppearanceObject = getOrCreateStateAppearenceObject(controlStateValueObject,controlState: controlState)
        controlStateAppearanceObject.image = image
        
        print("set State \(state)")
    }

    public func getButonImageForState(state:NSString)->UIImage!{
       
        return getButonImageForState(state, controlState: UIControlState.Normal)
        
        //        print("get State \(state)")
//        if let image = buttonsImageForStateDictionary[state] {
//            return image
//        }else{
//            return buttonsImageForStateDictionary[kDefaultAdaptiveState]
//        }
//        
      

    }
    
    public func getButonImageForState(state:NSString, controlState:UIControlState)->UIImage?{
        var controlStateValueObject = getOrCreateStateObjectForState(state)
        
         if var controlStateAppearanceObject = controlStateValueObject.getControlApearenceFor(controlState){
            return controlStateAppearanceObject.image
        }else{
            return nil
        }
    }
    
    public func setBackgroundButonImage(image:UIImage, state:String){
      //  buttonsImageForStateDictionary.updateValue(image, forKey:state)
        setBackgroundButonImage(image, state: state)
    }
    
    public func setBackgroundButtonImage(image:UIImage, state:String, controlState:UIControlState){
        //buttonsImageForStateDictionary.updateValue(image, forKey:state)
        var controlStateValueObject = getOrCreateStateObjectForState(state)
        var controlStateAppearanceObject = getOrCreateStateAppearenceObject(controlStateValueObject,controlState: controlState)
        controlStateAppearanceObject.backgroundImage = image
        
        print("set State \(state)")
    }
    
    public func getBackgroundImageForState(state:NSString)->UIImage?{
      
        return getBackgroundButonImageForState(state, controlState: UIControlState.Normal)
//        if let image = buttonsBackgroundImageForStateDictionary[state] {
//            return image
//        }else{
//            return buttonsBackgroundImageForStateDictionary[kDefaultAdaptiveState]
//        }
        
    }
    
    public func getBackgroundButonImageForState(state:NSString, controlState:UIControlState)->UIImage?{
        var controlStateValueObject = getOrCreateStateObjectForState(state)
        
        if var controlStateAppearanceObject = controlStateValueObject.getControlApearenceFor(controlState){
            return controlStateAppearanceObject.image
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
        
        if var controlStateValueObject = getOrCreateStateObjectForState(state){
            var controlStateAppearanceObject = controlStateValueObject.getControlApearenceFor(controlState)
            return controlStateAppearanceObject.titleColor!
        }else{
            var controlStateValueObject = getOrCreateStateObjectForState(kDefaultAdaptiveState)
            var controlStateAppearanceObject = controlStateValueObject.getControlApearenceFor(controlState)
            return controlStateAppearanceObject.titleColor!
        }
        
      
        
    }

}
