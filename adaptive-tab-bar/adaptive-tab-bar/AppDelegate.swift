//
//  AppDelegate.swift
//  adaptive-tab-bar
//
//  Created by Arcilite on 15.09.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit
import CoreGraphics
import QuartzCore
import AdaptiveTabBarExtension

let countDaysToSmallTextState = 14
let countDaysToImageState = 30

let defaultInsets = UIEdgeInsetsMake(0, 0,0, 0)
let defaultSmallTitleModeFont = UIFont(name: "Helvetica", size: 10.0)
let defaultSmallTitleModeImageInsets = UIEdgeInsetsMake(0,  0,  0,  0)
let defaultImageModeInsets = UIEdgeInsetsMake(6,  0,  -6,  0)
let defaultSmallTitleModeOffset = UIOffsetMake(0, 20)
let defaultOffset = UIOffsetMake(0, 00)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        var tabBarController:UITabBarController = self.window?.rootViewController as UITabBarController
        
        var tabBar:UITabBar = tabBarController.tabBar
        
        var installDate = NSDate(dateString:"2014-07-01")

        //var imagesArray:Array<String> = ["watch","man"]
        
       
        var adaptiveState = AdaptiveDateState(installDate: installDate,currentDate:NSDate(),countDaysToSmallTextState:countDaysToSmallTextState,countDaysToImageState:countDaysToImageState)
        
        
        var arrayApperance = apperanceArrayGenerate()
        
     
        var arrayButtons = tabBar.items as [AdaptiveTabBarItem]
        AdaptiveButtonsStateManager(state: adaptiveState,buttonsAray:arrayButtons ,buttonsApperance: arrayApperance)
        
        
        //tabBar.launchTabBarAdaptivityForDateSettings(TimeSettingsObject(startDate: installDate),itemSettings: AdaptiveTabBarSettingsObject(imagesArray: imagesArray ) )
        
        
        
        tabBar.barTintColor = UIColor(red: 169/255, green: 79/255, blue: 152/255, alpha: 1.0)

        return true
    }
    
    func apperanceArrayGenerate() -> [AdaptiveButtonApperance]{
        var watchAperance = AdaptiveButtonApperance();
        
        watchAperance.setButonTitle("watch", state: kDefaultAdaptiveState)
        watchAperance.setButonTitle("watch", state: kSmallTitleAdaptiveState)
        watchAperance.setButonTitle("", state: kImageAdaptiveState)
        
        watchAperance.setButonTitleFontForState(defaultFont, state: kDefaultAdaptiveState)
        watchAperance.setButonTitleFontForState(defaultSmallTitleModeFont, state: kSmallTitleAdaptiveState)
        
        watchAperance.setButtonImage(UIImage(named: "watch"), state: kDefaultAdaptiveState)
        
        watchAperance.setButtonImage(UIImage(named: "watch_smalltitle"), state: kSmallTitleAdaptiveState)
        watchAperance.setButtonImage(UIImage(named: "watch_smalltitle"), state: kSmallTitleAdaptiveState+selected)
      
        watchAperance.setButtonImage(UIImage(named: "watch_bigimage"), state: kImageAdaptiveState)
        watchAperance.setButtonImage(UIImage(named: "watch_bigimage"), state: kImageAdaptiveState+selected)
        
        watchAperance.setBackgroundButonImage(UIImage(named: " "), state: kSmallTitleAdaptiveState)
        
        
        watchAperance.setImageInsets(defaultInsets, state: kDefaultAdaptiveState);
        
        watchAperance.setImageInsets(defaultSmallTitleModeImageInsets, state: kSmallTitleAdaptiveState)
        //watchAperance.setImageInsets(defaultSmallTitleModeImageInsets, state: kSmallTitleAdaptiveState+selected)
        
        watchAperance.setTitleOffset(defaultOffset, state: kDefaultAdaptiveState)
        //watchAperance.setTitleOffset(defaultSmallTitleModeOffset, state: kSmallTitleAdaptiveState)
        watchAperance.setImageInsets(defaultImageModeInsets, state: kImageAdaptiveState);
        
        
        var userAperance = AdaptiveButtonApperance();
        
        userAperance.setButonTitle("man", state: kDefaultAdaptiveState)
        userAperance.setButonTitle("", state: kImageAdaptiveState)
        
        userAperance.setButonTitleFontForState(defaultFont, state: kDefaultAdaptiveState)
        userAperance.setButonTitleFontForState(defaultSmallTitleModeFont, state: kSmallTitleAdaptiveState)
        
        
        
        userAperance.setButtonImage(UIImage(named: "man"), state: kDefaultAdaptiveState)
        
        userAperance.setButtonImage(UIImage(named: "man_smalltitle"), state: kSmallTitleAdaptiveState)
    
        userAperance.setButtonImage(UIImage(named: "man_bigimage"), state: kImageAdaptiveState)
        userAperance.setButtonImage(UIImage(named: "man_bigimage"), state: kImageAdaptiveState+selected)
        
        
        userAperance.setBackgroundButonImage(UIImage(named: " "), state: kSmallTitleAdaptiveState)
        
        
        userAperance.setImageInsets(defaultInsets, state: kDefaultAdaptiveState);
        userAperance.setImageInsets(defaultInsets, state: kSmallTitleAdaptiveState)
        userAperance.setImageInsets(defaultImageModeInsets, state: kImageAdaptiveState)
        
        
        userAperance.setTitleOffset(defaultOffset, state: kDefaultAdaptiveState)
        
        return [watchAperance ,userAperance]
    }
    
    
}

