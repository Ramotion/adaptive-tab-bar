//
//  AppDelegate.swift
//  adaptive-tab-bar
//
//  Created by Arcilite on 15.09.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

let countDaysForSmaltextState = 3
let countDaysForImageModeState = 7

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
        
        var curentCountLaunches = 6
        
        var adaptiveState = AdaptiveLaunchesState(curentCountLaunches:curentCountLaunches,countLaunchesToSmallTextState:countDaysForSmaltextState,countLaunchesToImageState:countDaysForImageModeState)
        
        
        var buttonsAppearances = buttonsAppearancesGenerate() //func butonsApprencesGenerate() -> [AdaptiveButtonApperance]
        
     
        var arrayButtons = tabBar.items as [AdaptiveTabBarItem]
       
        AdaptiveButtonsStateManager(state: adaptiveState,buttonsAray:arrayButtons ,buttonsAppearance: buttonsAppearances)
        
        
       
        return true
    }
    
    
    func buttonsAppearancesGenerate() -> [AdaptiveButtonAppearance]{
       
        
        var imageExtensionsForStates:Dictionary = [ kSmallTitleAdaptiveState:"_smalltitle",
                                                    kImageAdaptiveState:"_bigimage",
                                                    kSmallTitleAdaptiveState+selected :"_smalltitle",
                                                    kImageAdaptiveState+selected:"_bigimage" ]
        
        
        var watchApperance = AdaptiveButtonAppearance();
        
        watchApperance.setButonTitle("watch", state: kDefaultAdaptiveState)
        watchApperance.setButonTitle("watch", state: kSmallTitleAdaptiveState)
        watchApperance.setButonTitle("", state: kImageAdaptiveState)
        watchApperance.setTitleColor(UIColor.whiteColor(), state: kDefaultAdaptiveState)
        
        watchApperance.setButonTitleFontForState(defaultFont, state: kDefaultAdaptiveState)
        
        watchApperance.setButonTitleFontForState(defaultSmallTitleModeFont, state: kSmallTitleAdaptiveState)
        
      
        watchApperance.setImageNamesForStatesImageExtesions("watch", imageExtensionsForState:imageExtensionsForStates)

        
        watchApperance.setImageInsets(defaultInsets, state: kDefaultAdaptiveState);
        
        watchApperance.setImageInsets(defaultSmallTitleModeImageInsets, state: kSmallTitleAdaptiveState)
        watchApperance.setTitleOffset(defaultOffset, state: kDefaultAdaptiveState)
        watchApperance.setImageInsets(defaultImageModeInsets, state: kImageAdaptiveState);
        
        
        var userAperance = AdaptiveButtonAppearance();
        
       
        userAperance.setAllCommonApperanceFrom(watchApperance)
       
        userAperance.setButonTitle("user", state: kDefaultAdaptiveState)
        userAperance.setButonTitle("", state: kImageAdaptiveState)
        userAperance.setImageNamesForStatesImageExtesions("man", imageExtensionsForState:imageExtensionsForStates)
       
        
        
        var messageAperance = AdaptiveButtonAppearance();
        
        messageAperance.setAllCommonApperanceFrom((watchApperance))

        messageAperance.setButonTitle("message", state: kDefaultAdaptiveState)
        messageAperance.setButonTitle("", state: kImageAdaptiveState)
        
        messageAperance.setImageNamesForStatesImageExtesions("messages", imageExtensionsForState:imageExtensionsForStates)
       
       
        
        
        var menuAperance = AdaptiveButtonAppearance();
        
        
        menuAperance.setAllCommonApperanceFrom((watchApperance))
        
        menuAperance.setButonTitle("dial", state: kDefaultAdaptiveState)
        menuAperance.setButonTitle("", state: kImageAdaptiveState)
        menuAperance.setImageNamesForStatesImageExtesions("menu", imageExtensionsForState:imageExtensionsForStates)
        
        
     
        var moreAperance = AdaptiveButtonAppearance();
        
        moreAperance.setAllCommonApperanceFrom((watchApperance))
        
        moreAperance.setButonTitle("more", state: kDefaultAdaptiveState)
        moreAperance.setButonTitle("", state: kImageAdaptiveState)
        
        moreAperance.setImageNamesForStatesImageExtesions("more", imageExtensionsForState:imageExtensionsForStates)
      
        
        
        return [watchApperance ,messageAperance,userAperance,menuAperance,moreAperance]

    }
    
    
}

