//
//  AdaptiveTabBarExtension.swift
//  adaptive-tab-bar
//
//  Created by Arcilite on 15.09.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit



extension UITabBar{
    
    
    
    func  launchTabBarAdaptivityForDateSettings(dateSetings:TimeSettingsObject, itemSettings:AdaptiveTabBarSettingsObject){
        
        
        var mode:TabMode = dateSetings.tabModeForElapsedTime()
        
        var tabTitleFont : UIFont = itemSettings.defaultModeFont
        var tabImageInset: UIEdgeInsets = UIEdgeInsetsMake(0,0,0,0)
        var tabTitleOffset: UIOffset = UIOffsetMake(0, 0)
        var itemImagesArray = itemSettings.imageNamesArray as [String]!
        
        
        if(mode == TabMode.SmallTextMode){
            
            tabTitleFont = itemSettings.smallTitleModeFont
            tabTitleOffset = itemSettings.smallTitleModeOffset
            tabImageInset = itemSettings.smallTitleModeImageInsets
            itemImagesArray = itemSettings.smallTitleImageNamesArray
            
        }else if(mode == TabMode.ImageMode){
            
            tabTitleOffset = UIOffsetMake(0,50)
            tabImageInset = itemSettings.onlyImageModeInsets
            itemImagesArray = itemSettings.imageModeImageNamesArray
           
        }
        
        
        var tabBarItemArray = self.items as [UITabBarItem]
        for var index = 0; index < tabBarItemArray.count; ++index {
            println("index is \(index)")
            
            var itemTabBar = tabBarItemArray[index]
            
            itemTabBar.setTitleTextAttributes(NSDictionary(objects: [tabTitleFont], forKeys: [NSFontAttributeName]), forState: UIControlState.Normal)
            itemTabBar.setTitlePositionAdjustment(tabTitleOffset)
            itemTabBar.imageInsets = tabImageInset
            var imageName:String = itemImagesArray[index]
            itemTabBar.image = UIImage(named: imageName)
            itemTabBar.selectedImage = UIImage(named: imageName)
        }

        
    }
    
    
   
    
}

