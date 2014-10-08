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
import AdaptiveController



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
       
        UITabBar.appearance().selectedImageTintColor = tabColor
        UITabBar.appearance().barTintColor = UIColor.clearColor()
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().selectionIndicatorImage = UIImage(named: "backgroud_tab")
        UITabBar.appearance().itemPositioning = UITabBarItemPositioning.Fill
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor()],forState: UIControlState.Normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: tabColor],forState: UIControlState.Selected)
        
        
        var tabBarController:UITabBarController = self.window?.rootViewController as UITabBarController
        
        var tabBar:UITabBar = tabBarController.tabBar
        tabBar.barTintColor = tabColor
        tabBar.clipsToBounds = true
        
        var installDate = NSDate(dateString:"2014-07-7")

       
        var adaptiveState = AdaptiveDateState(installDate: installDate,currentDate:NSDate(),countDaysToSmallTextState:countDaysToSmallTextState,countDaysToImageState:countDaysToImageState)
        
        
        var butonsApperances = buttonsAppearancesGenerate()
        
     
        var arrayButtons = tabBar.items as [AdaptiveTabBarItem]
       
        AdaptiveButtonsStateManager(state: adaptiveState,buttonsAray:arrayButtons ,buttonsAppearance: butonsApperances)
        
        
       
        return true
    }
    
    
    func buttonsAppearancesGenerate() -> [AdaptiveButtonAppearance]{
       
        
        var imageExtensionsForStates:Dictionary = [ kDefaultAdaptiveState:"",
                                                    kSmallTitleAdaptiveState:"_smalltitle",
                                                    kImageAdaptiveState:"_bigimage",
                                                    kSmallTitleAdaptiveState+selected :"_smalltitle",
                                                    kImageAdaptiveState+selected:"_bigimage" ]
        
        
        var watchAperance = AdaptiveButtonAppearance();
        
        watchAperance.setButonTitle("watch", state: kDefaultAdaptiveState)
        watchAperance.setButonTitle("watch", state: kSmallTitleAdaptiveState)
        watchAperance.setButonTitle("", state: kImageAdaptiveState)
        watchAperance.setTitleColor(UIColor.whiteColor(), state: kDefaultAdaptiveState)
        
        watchAperance.setButonTitleFontForState(defaultFont, state: kDefaultAdaptiveState)
        
        watchAperance.setButonTitleFontForState(defaultSmallTitleModeFont, state: kSmallTitleAdaptiveState)
        
      
        watchAperance.setImageNamesForStatesImageExtesions("watch", imageExtensionsForState:imageExtensionsForStates)

        
        watchAperance.setImageInsets(defaultInsets, state: kDefaultAdaptiveState);
        
        watchAperance.setImageInsets(defaultSmallTitleModeImageInsets, state: kSmallTitleAdaptiveState)
        watchAperance.setTitleOffset(defaultOffset, state: kDefaultAdaptiveState)
        watchAperance.setImageInsets(defaultImageModeInsets, state: kImageAdaptiveState);
        
        
        var userAperance = AdaptiveButtonAppearance();
        
       
        userAperance.setAllCommonApperanceFrom(watchAperance)
       
        userAperance.setButonTitle("user", state: kDefaultAdaptiveState)
        userAperance.setButonTitle("", state: kImageAdaptiveState)
        userAperance.setImageNamesForStatesImageExtesions("man", imageExtensionsForState:imageExtensionsForStates)
       
        
        
        var messageAperance = AdaptiveButtonAppearance();
        
        messageAperance.setAllCommonApperanceFrom((watchAperance))

        messageAperance.setButonTitle("message", state: kDefaultAdaptiveState)
        messageAperance.setButonTitle("", state: kImageAdaptiveState)
        
        messageAperance.setImageNamesForStatesImageExtesions("messages", imageExtensionsForState:imageExtensionsForStates)
       
       
        
        
        var menuAperance = AdaptiveButtonAppearance();
        
        
        menuAperance.setAllCommonApperanceFrom((watchAperance))
        
        menuAperance.setButonTitle("dial", state: kDefaultAdaptiveState)
        menuAperance.setButonTitle("", state: kImageAdaptiveState)
        menuAperance.setImageNamesForStatesImageExtesions("menu", imageExtensionsForState:imageExtensionsForStates)
        
        
     
        var moreAperance = AdaptiveButtonAppearance();
        
        moreAperance.setAllCommonApperanceFrom((watchAperance))
        
        moreAperance.setButonTitle("more", state: kDefaultAdaptiveState)
        moreAperance.setButonTitle("", state: kImageAdaptiveState)
        
        moreAperance.setImageNamesForStatesImageExtesions("more", imageExtensionsForState:imageExtensionsForStates)
      
        
        
        return [watchAperance ,messageAperance,userAperance,menuAperance,moreAperance]

    }
    
    
}

