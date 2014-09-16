//
//  AdaptiveTabBarExtension.swift
//  adaptive-tab-bar
//
//  Created by Arcilite on 15.09.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit
let defaultSmallTitleModeFont = UIFont(name: "Helvetica", size: 10.0)
let defaultSmallTitleModeImageInsets = UIEdgeInsetsMake(6,  0,  -6,  0)
let defaultImageModeInsets = UIEdgeInsetsMake(-3, -8,-13, -8)
let defaultSmallTitleModeOffset = UIOffsetMake(0, -2)

let twoWeaks:Double = 14
let month:Double = 31

extension UITabBar{
    
    
    func  launchDefaultTabBarAdaptivity(startDate:NSDate){
        
        let todayDate = NSDate()
        
        self.launchTabBarAdaptivity(startDate,currentDate:todayDate,smallTitleModeFont:defaultSmallTitleModeFont,smallTitleModeImageInsets:defaultSmallTitleModeImageInsets,imageModeInsets:defaultImageModeInsets,smallTitleModeOffset:defaultSmallTitleModeOffset,daysForSmallTitleMode:twoWeaks,daysForImageMode:month)
        
    }
    
    func  launchTabBarAdaptivity(startDate:NSDate,currentDate:NSDate,smallTitleModeFont: UIFont,smallTitleModeImageInsets:UIEdgeInsets,imageModeInsets:UIEdgeInsets,smallTitleModeOffset:UIOffset,daysForSmallTitleMode:Double,daysForImageMode:Double ){
        
        var currentDate = NSDate()
        
        
        var days =  Double(currentDate.daysBetween(startDate,dayTo:currentDate))
        
        
        if days > daysForSmallTitleMode && days < daysForImageMode{
            
            self.setTabItems(smallTitleModeFont , state:UIControlState.Normal,imageInsets:smallTitleModeImageInsets,offset:smallTitleModeOffset)
            
        }else if days > daysForImageMode{
            self.setTabItems(smallTitleModeFont , state:UIControlState.Normal,imageInsets:imageModeInsets,offset:UIOffsetMake(0,-20))
        }
        
        
    }
    
    
    func setTabItems(font:UIFont,state: UIControlState,imageInsets:UIEdgeInsets,offset:UIOffset){
        
        for item  in self.items!{
            var itemTabBar: UITabBarItem = item as UITabBarItem
            
            item.setTitleTextAttributes(NSDictionary(objects: [font], forKeys: [NSFontAttributeName]), forState: state)
            itemTabBar.setTitlePositionAdjustment(offset)
            itemTabBar.imageInsets = imageInsets
            // itemTabBar.layer
        }
        
    }
    
}

