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
        
        var installDate = NSDate(dateString:"2014-09-17")

       
        var adaptiveState = AdaptiveDateState(installDate: installDate,currentDate:NSDate(),countDaysToSmallTextState:countDaysToSmallTextState,countDaysToImageState:countDaysToImageState)
        
        
        var arrayApperance = apperanceArrayGenerate()
        
     
        var arrayButtons = tabBar.items as [AdaptiveTabBarItem]
        AdaptiveButtonsStateManager(state: adaptiveState,buttonsAray:arrayButtons ,buttonsApperance: arrayApperance)
        
        UITabBar.appearance().selectedImageTintColor = UIColor(red: 169/255, green: 79/255, blue: 152/255, alpha: 1.0)
        UITabBar.appearance().barTintColor = UIColor.clearColor()
        UITabBar.appearance().selectionIndicatorImage = UIImage(named: "backgroud_tab")
        UITabBar.appearance().itemPositioning = UITabBarItemPositioning.Fill
       
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor()],forState: UIControlState.Normal)
        
        tabBar.barTintColor = UIColor(red: 169/255, green: 79/255, blue: 152/255, alpha: 1.0)

        return true
    }
    
    func apperanceArrayGenerate() -> [AdaptiveButtonApperance]{
       
        var watchAperance = AdaptiveButtonApperance();
        
        watchAperance.setButonTitle("watch", state: kDefaultAdaptiveState)
        watchAperance.setButonTitle("watch", state: kSmallTitleAdaptiveState)
        watchAperance.setButonTitle("", state: kImageAdaptiveState)
        watchAperance.setTitleColor(UIColor.whiteColor(), state: kDefaultAdaptiveState)
        
        watchAperance.setButonTitleFontForState(defaultFont, state: kDefaultAdaptiveState)
        watchAperance.setButonTitleFontForState(defaultSmallTitleModeFont, state: kSmallTitleAdaptiveState)
        
        watchAperance.setButtonImage(UIImage(named: "watch"), state: kDefaultAdaptiveState)
        
        watchAperance.setButtonImage(UIImage(named: "watch_smalltitle"), state: kSmallTitleAdaptiveState)
        watchAperance.setButtonImage(UIImage(named: "watch_smalltitle"), state: kSmallTitleAdaptiveState+selected)
        watchAperance.setButtonImage(UIImage(named: "watch_bigimage"), state: kImageAdaptiveState)
        watchAperance.setButtonImage(UIImage(named: "watch_bigimage"), state: kImageAdaptiveState+selected)
        
        watchAperance.setImageInsets(defaultInsets, state: kDefaultAdaptiveState);
        
        watchAperance.setImageInsets(defaultSmallTitleModeImageInsets, state: kSmallTitleAdaptiveState)
        watchAperance.setTitleOffset(defaultOffset, state: kDefaultAdaptiveState)
        watchAperance.setImageInsets(defaultImageModeInsets, state: kImageAdaptiveState);
        
        
        var userAperance = AdaptiveButtonApperance();
        
       
        userAperance.setAllCommonApperanceFrom(watchAperance)
       
        userAperance.setButonTitle("user", state: kDefaultAdaptiveState)
        userAperance.setButonTitle("", state: kImageAdaptiveState)
        
        userAperance.setButtonImage(UIImage(named: "man"), state: kDefaultAdaptiveState)
        userAperance.setButtonImage(UIImage(named: "man_smalltitle"), state: kSmallTitleAdaptiveState)
        userAperance.setButtonImage(UIImage(named: "man_bigimage"), state: kImageAdaptiveState)
        userAperance.setButtonImage(UIImage(named: "man_bigimage"), state: kImageAdaptiveState+selected)
        userAperance.setBackgroundButonImage(UIImage(named: " "), state: kSmallTitleAdaptiveState)
        
        
        var messageAperance = AdaptiveButtonApperance();
        
        messageAperance.setAllCommonApperanceFrom((watchAperance))

        messageAperance.setButonTitle("message", state: kDefaultAdaptiveState)
        messageAperance.setButonTitle("", state: kImageAdaptiveState)
        
        messageAperance.setButtonImage(UIImage(named: "messages"), state: kDefaultAdaptiveState)
        messageAperance.setButtonImage(UIImage(named: "messages_smalltitle"), state: kSmallTitleAdaptiveState)
        messageAperance.setButtonImage(UIImage(named: "messages_bigimage"), state: kImageAdaptiveState)
        messageAperance.setButtonImage(UIImage(named: "messages_bigimage"), state: kImageAdaptiveState+selected)
       
       
        
        
        var menuAperance = AdaptiveButtonApperance();
        
        
        menuAperance.setAllCommonApperanceFrom((watchAperance))
        
        menuAperance.setButonTitle("dial", state: kDefaultAdaptiveState)
        menuAperance.setButonTitle("", state: kImageAdaptiveState)
        
        menuAperance.setButtonImage(UIImage(named: "menu"), state: kDefaultAdaptiveState)
        menuAperance.setButtonImage(UIImage(named: "menu_smalltitle"), state: kSmallTitleAdaptiveState)
        menuAperance.setButtonImage(UIImage(named: "menu_bigimage"), state: kImageAdaptiveState)
        menuAperance.setButtonImage(UIImage(named: "menu_bigimage"), state: kImageAdaptiveState+selected)
     
    
        
        var moreAperance = AdaptiveButtonApperance();
        
        moreAperance.setAllCommonApperanceFrom((watchAperance))
        
        moreAperance.setButonTitle("more", state: kDefaultAdaptiveState)
        moreAperance.setButonTitle("", state: kImageAdaptiveState)
        
        moreAperance.setButtonImage(UIImage(named: "more"), state: kDefaultAdaptiveState)
        moreAperance.setButtonImage(UIImage(named: "more_smalltitle"), state: kSmallTitleAdaptiveState)
        moreAperance.setButtonImage(UIImage(named: "more_bigimage"), state: kImageAdaptiveState)
        moreAperance.setButtonImage(UIImage(named: "more_bigimage"), state: kImageAdaptiveState+selected)
      
        
        
        return [watchAperance ,userAperance,messageAperance,menuAperance,moreAperance]

    }
    
    
}

