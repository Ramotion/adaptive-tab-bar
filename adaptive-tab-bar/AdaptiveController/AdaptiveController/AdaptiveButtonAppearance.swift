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
      
    }
    
    
    public func setImageNamesForStatesImageExtesions(imageName :String ,imageExtensionsForState:Dictionary <String,String>){
        
         self.setButtonImage(UIImage(named: imageName), state: kDefaultAdaptiveState)
        for (state,imageExtension) in imageExtensionsForState {
           self.setButtonImage(UIImage(named: imageName+imageExtension), state: state)
        }
        
        
    }
    
    public  func setButonTitle(title:NSString, state:String){
        println(title)
        println(state)
        butonsTitleForStateDictionary.updateValue(title, forKey:state)
    }
    
    public func getButonTitleForState(state:NSString)->String!{
        
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
    
    public func setButonTitleFontForState(font:UIFont, state:String){
        butonsTitleFontForStateDictionary.updateValue(font, forKey:state)
    }
    
    public func getButonTitleFontForState(state:NSString)->UIFont{
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
