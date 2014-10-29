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
        //self.stateDictionary = adaptiveButtonApperance.stateDictionary
    }
    
    public func setAllCommonApperanceFrom(adaptiveButtonApperance:AdaptiveButtonAppearance){
        self.setInsetsFromAdaptiveButtonApperance(adaptiveButtonApperance)
        self.setFontsFromAdaptiveButtonApperance(adaptiveButtonApperance)
        self.buttonsTitleColorsForStateDictionary = adaptiveButtonApperance.buttonsTitleColorsForStateDictionary
      
    }
    
    
    public func setImageNamesForStatesImageExtesions(imageName :String ,imageExtensionsForState:Dictionary <String,String>){
        
         self.setButtonImage(UIImage(named: imageName)!, state: kDefaultAdaptiveState)
        for (state,imageExtension) in imageExtensionsForState {
           self.setButtonImage(UIImage(named: imageName+imageExtension)!, state: state)
        }
        
        
    }
    
    func getOrCreateStateObjectForState(state:String) -> ControlStateValue{
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
                controlStateValueObject.setControlApearence(stateObject,state: controlState)
                return stateObject
            }
            
        }
    }
    
    
    
    public  func setButonTitle(title:NSString, state:String){
        setButonTitle(title, state:state, controlState:UIControlState.Normal)
        //butonsTitleForStateDictionary.updateValue(title, forKey:state)
    }
    
    public func getButonTitleForState(state:NSString)->String!{
        return getButonTitleForState(state, controlState: UIControlState.Normal)
        //        if let title = butonsTitleForStateDictionary[state] {
        //            return title
        //        }else{
        //            if let title = butonsTitleForStateDictionary[kDefaultAdaptiveState] {
        //                return title
        //            }else{
        //                return kNotTitle
        //            }
        //        }
        
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
       // butonsTitleFontForStateDictionary.updateValue(font, forKey:state)
        setButonTitleFont(font, state: state, controlState: UIControlState.Normal)
    }
    
    public func getButonTitleFontForState(state:NSString)->UIFont{
        
        if let font =  getButonTitleFontForState(state, controlState: UIControlState.Normal){
            return font
        }else{
            return defaultFont!
        }
        
       // return getButonTitleFontForState(state, controlState: UIControlState.Normal)
//        var font:UIFont? = butonsTitleFontForStateDictionary[state]
//        
//        if let font = butonsTitleFontForStateDictionary[state] {
//            return font
//        }else{
//            
//            if let font = butonsTitleFontForStateDictionary[kDefaultAdaptiveState] {
//                return font
//            }else{
//                return defaultFont!
//            }
//        }
    
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
        // butonsTitleForStateDictionary.updateValue(title, forKey:state)
    }
    
    
    
    
   
    
    
    public func setButtonImage(image:UIImage, state:String){
        buttonsImageForStateDictionary.updateValue(image, forKey:state)
         print("set State \(state)")
    }
    
    public func getButonImageForState(state:NSString)->UIImage!{
        
        print("get State \(state)")
        if let image = buttonsImageForStateDictionary[state] {
            return image
        }else{
            return buttonsImageForStateDictionary[kDefaultAdaptiveState]
        }
        
      

    }
    
    public func setBackgroundButonImage(image:UIImage, state:String){
        buttonsImageForStateDictionary.updateValue(image, forKey:state)
    }
    
    public func getBackgroundImageForState(state:NSString)->UIImage?{
      
        if let image = buttonsBackgroundImageForStateDictionary[state] {
            return image
        }else{
            return buttonsBackgroundImageForStateDictionary[kDefaultAdaptiveState]
        }
        
    }
    
    
    public func setImageInsets(insets:UIEdgeInsets, state:String){
        buttonsImageInsetsForStateDictionary.updateValue(insets, forKey:state)
    }
    
    public func getImageInsetsForState(state:NSString)->UIEdgeInsets!{
        
        if let insets = buttonsImageInsetsForStateDictionary[state] {
           return buttonsImageInsetsForStateDictionary[state]!
        }else{
             return buttonsImageInsetsForStateDictionary[kDefaultAdaptiveState]
        }
        
    }
    
    public func setTitleOffset(insets:UIOffset, state:String){
        buttonsTitleInsetsForStateDictionary.updateValue(insets, forKey:state)
    }
    
    public func getTitleOffsetForState(state:NSString)->UIOffset!{
       
        var offset:UIOffset? = buttonsTitleInsetsForStateDictionary[state]
        if(offset == nil){
            offset = buttonsTitleInsetsForStateDictionary[kDefaultAdaptiveState]?
        }
        
        return offset!
    }
    
    
    public func setTitleColor(color:UIColor, state:String){
        buttonsTitleColorsForStateDictionary.updateValue(color, forKey:state)
    }
    
    public func getTitleColorForState(state:NSString)->UIColor!{
        
        var offset:UIColor? = buttonsTitleColorsForStateDictionary[state]
        if(offset == nil){
            offset = buttonsTitleColorsForStateDictionary[kDefaultAdaptiveState]?
        }
        
        return offset!
    }

}
