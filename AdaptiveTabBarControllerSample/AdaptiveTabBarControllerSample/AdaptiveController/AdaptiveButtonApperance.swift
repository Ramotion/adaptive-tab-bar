//
//  AdaptiveButtonApperance.swift
//  AdaptiveTabBarControllerSample
//
//  Created by Arcilite on 18.09.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit

class AdaptiveButtonApperance: NSObject {
   
    
    var butonsTitleForStateDictionary:Dictionary <String,String> = Dictionary<String,String>()
    var butonsTitleFontForStateDictionary:Dictionary <String,UIFont> = Dictionary<String,UIFont>()
    var buttonsImageForStateDictionary:Dictionary <String,UIImage> = Dictionary<String,UIImage>()
    var buttonsBackgroundImageForStateDictionary:Dictionary <String,UIImage> = Dictionary<String,UIImage>()
    
    
    var buttonsImageInsetsForStateDictionary:Dictionary <String,UIEdgeInsets> = Dictionary<String,UIEdgeInsets>()
    var buttonsTitleInsetsForStateDictionary:Dictionary <String,UIOffset> = Dictionary<String,UIOffset>()
    
    
    func setButonTitle(title:NSString, state:String){
        butonsTitleForStateDictionary.updateValue(title, forKey:state)
    }
    
    func getButonTitleForState(state:NSString)->String{
       return butonsTitleForStateDictionary[state]!
    }
    
    func setButonTitleFontForState(font:UIFont, state:String){
        butonsTitleFontForStateDictionary.updateValue(font, forKey:state)
    }
    
    func getButonTitleFontForState(state:NSString)->UIFont{
        return butonsTitleFontForStateDictionary[state]!
    }
    
    func setButtonImage(image:UIImage, state:String){
        buttonsImageForStateDictionary.updateValue(image, forKey:state)
    }
    
    func getButonImageForState(state:NSString)->UIImage{
        return buttonsImageForStateDictionary[state]!
    }
    
    func setBackgroundButonImage(image:UIImage, state:String){
        buttonsImageForStateDictionary.updateValue(image, forKey:state)
    }
    
    func getBackgroundImageForState(state:NSString)->UIImage{
        return buttonsImageForStateDictionary[state]!
    }
    
    
    func setImageInsets(insets:UIEdgeInsets, state:String){
        buttonsImageInsetsForStateDictionary.updateValue(insets, forKey:state)
    }
    
    func getImageInsetsForState(state:NSString)->UIEdgeInsets{
        return buttonsImageInsetsForStateDictionary[state]!
    }
    
    func setTitleOffset(insets:UIOffset, state:String){
        buttonsTitleInsetsForStateDictionary.updateValue(insets, forKey:state)
    }
    
    func getTitleOffsetForState(state:NSString)->UIOffset{
        return buttonsTitleInsetsForStateDictionary[state]!
    }
    
}
