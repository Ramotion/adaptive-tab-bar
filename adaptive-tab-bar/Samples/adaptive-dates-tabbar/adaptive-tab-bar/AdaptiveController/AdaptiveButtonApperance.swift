//
//  AdaptiveButtonApperance.swift
//  AdaptiveTabBarControllerSample
//
//  Created by Arcilite on 18.09.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit
let kNotTitle = ""
let defaultFont = UIFont(name: "Helvetica", size: 14.0)

class AdaptiveButtonApperance: NSObject {
    

    private var butonsTitleForStateDictionary:Dictionary <String,String> = Dictionary<String,String>()
    private var butonsTitleFontForStateDictionary:Dictionary <String,UIFont> = Dictionary<String,UIFont>()
    private var buttonsImageForStateDictionary:Dictionary <String,UIImage> = Dictionary<String,UIImage>()
    private var buttonsBackgroundImageForStateDictionary:Dictionary <String,UIImage> = Dictionary<String,UIImage>()
    
    
    private var buttonsImageInsetsForStateDictionary:Dictionary <String,UIEdgeInsets> = Dictionary<String,UIEdgeInsets>()
    private var buttonsTitleInsetsForStateDictionary:Dictionary <String,UIOffset> = Dictionary<String,UIOffset>()
    
    private var buttonsTitleColorsForStateDictionary:Dictionary <String,UIColor> = Dictionary<String,UIColor>()
    
    func setInsetsFromAdaptiveButtonApperance(adaptiveButtonApperance:AdaptiveButtonApperance){
        
        self.buttonsImageInsetsForStateDictionary = adaptiveButtonApperance.buttonsImageInsetsForStateDictionary
        
        self.buttonsTitleInsetsForStateDictionary = adaptiveButtonApperance.buttonsTitleInsetsForStateDictionary
        
    
    }
    
    func setFontsFromAdaptiveButtonApperance(adaptiveButtonApperance:AdaptiveButtonApperance){
        
        self.butonsTitleFontForStateDictionary =  adaptiveButtonApperance.butonsTitleFontForStateDictionary
    }
    
    func setAllCommonApperanceFrom(adaptiveButtonApperance:AdaptiveButtonApperance){
        self.setInsetsFromAdaptiveButtonApperance(adaptiveButtonApperance)
        self.setFontsFromAdaptiveButtonApperance(adaptiveButtonApperance)
        self.buttonsTitleColorsForStateDictionary = adaptiveButtonApperance.buttonsTitleColorsForStateDictionary
      
    }
    
    
    func setImageNamesForStatesImageExtesions(imageName :String ,imageExtensionsForState:Dictionary <String,String>){
        
        self.setButtonImage(UIImage(named: imageName), state: kDefaultAdaptiveState)
        
        for (state,imageExtension) in imageExtensionsForState {
           self.setButtonImage(UIImage(named: imageName+imageExtension), state: state)
        }
        
    }
    
    func setButonTitle(title:NSString, state:String){
        butonsTitleForStateDictionary.updateValue(title, forKey:state)
    }
    
    func getButonTitleForState(state:NSString)->String!{
        
        if let title = butonsTitleForStateDictionary[state] {
            return title
        }else{
            if let title = butonsTitleForStateDictionary[kDefaultAdaptiveState] {
                return title
            }else{
                return kNotTitle
            }
        }
     
    }
    
    func setButonTitleFontForState(font:UIFont, state:String){
        butonsTitleFontForStateDictionary.updateValue(font, forKey:state)
    }
    
    func getButonTitleFontForState(state:NSString)->UIFont{
        var font:UIFont? = butonsTitleFontForStateDictionary[state]
        
        if let font = butonsTitleFontForStateDictionary[state] {
            return font
        }else{
            
            if let font = butonsTitleFontForStateDictionary[kDefaultAdaptiveState] {
                return font
            }else{
                return defaultFont
            }
        }
    
    }
    
    
    
    
    func setButtonImage(image:UIImage, state:String){
        buttonsImageForStateDictionary.updateValue(image, forKey:state)
         print("set State \(state)")
    }
    
    func getButonImageForState(state:NSString)->UIImage!{
       
        print("get State \(state)")
        if let image = buttonsImageForStateDictionary[state] {
            return image
        }else{
            return buttonsImageForStateDictionary[kDefaultAdaptiveState]
        }
        
      

    }
    
    func setBackgroundButonImage(image:UIImage, state:String){
        buttonsImageForStateDictionary.updateValue(image, forKey:state)
    }
    
    func getBackgroundImageForState(state:NSString)->UIImage?{
      
        if let image = buttonsBackgroundImageForStateDictionary[state] {
            return image
        }else{
            return buttonsBackgroundImageForStateDictionary[kDefaultAdaptiveState]
        }
        
    }
    
    
    func setImageInsets(insets:UIEdgeInsets, state:String){
        buttonsImageInsetsForStateDictionary.updateValue(insets, forKey:state)
    }
    
    func getImageInsetsForState(state:NSString)->UIEdgeInsets!{
        
        if let insets = buttonsImageInsetsForStateDictionary[state] {
           return buttonsImageInsetsForStateDictionary[state]!
        }else{
             return buttonsImageInsetsForStateDictionary[kDefaultAdaptiveState]
        }
        
    }
    
    func setTitleOffset(insets:UIOffset, state:String){
        buttonsTitleInsetsForStateDictionary.updateValue(insets, forKey:state)
    }
    
    func getTitleOffsetForState(state:NSString)->UIOffset!{
       
        var offset:UIOffset? = buttonsTitleInsetsForStateDictionary[state]
        if(offset == nil){
            offset = buttonsTitleInsetsForStateDictionary[kDefaultAdaptiveState]?
        }
        
        return offset!
    }
    
    
    func setTitleColor(color:UIColor, state:String){
        buttonsTitleColorsForStateDictionary.updateValue(color, forKey:state)
    }
    
    func getTitleColorForState(state:NSString)->UIColor!{
        
        var offset:UIColor? = buttonsTitleColorsForStateDictionary[state]
        if(offset == nil){
            offset = buttonsTitleColorsForStateDictionary[kDefaultAdaptiveState]?
        }
        
        return offset!
    }

}
