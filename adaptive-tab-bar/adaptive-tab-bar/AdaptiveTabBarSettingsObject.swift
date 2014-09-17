//
//  AdaptiveTabBarSettingsObject.swift
//  adaptive-tab-bar
//
//  Created by Arcilite on 16.09.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit

let defaultFont = UIFont(name: "Helvetica", size: 14.0)
let defaultSmallTitleModeFont = UIFont(name: "Helvetica", size: 10.0)
let defaultSmallTitleModeImageInsets = UIEdgeInsetsMake(6,  0,  -6,  0)
let defaultImageModeInsets = UIEdgeInsetsMake(-3, -8,-13, -8)
let defaultSmallTitleModeOffset = UIOffsetMake(0, -2)

let defaultSmallTittleModeImageExtesion = "_smalltitle"
let defaultImageModeImageExtesion = "_bigimage"

class AdaptiveTabBarSettingsObject: NSObject {
   
    var defaultModeFont : UIFont = defaultFont
    var smallTitleModeFont : UIFont = defaultSmallTitleModeFont
    
    var smallTitleModeImageInsets = UIEdgeInsetsMake(0,  0,  0,  0)
    var onlyImageModeInsets = UIEdgeInsetsMake(6,  0,  -6,  0)
    var smallTitleModeOffset = defaultSmallTitleModeOffset
   
    var imageNamesArray:Array<String>?
    var imageSelectedNamesArray:Array<String>= Array<String>()
    var smallTitleImageNamesArray:Array<String> = Array<String>() // array normal state images
    var imageModeImageNamesArray:Array<String> = Array<String>()
    
    override init() {
        super.init()
        
    }
    
    convenience init(imagesArray:Array<String>) {
       self.init()
        self.imageNamesArray = imagesArray
        
        for imageName in imagesArray{
            imageModeImageNamesArray.append(imageName + defaultImageModeImageExtesion)
            smallTitleImageNamesArray.append(imageName + defaultSmallTittleModeImageExtesion)
            imageSelectedNamesArray.append(imageName)
        }
        
        println(imageModeImageNamesArray)
        println(smallTitleImageNamesArray)
    }
    
    
}
