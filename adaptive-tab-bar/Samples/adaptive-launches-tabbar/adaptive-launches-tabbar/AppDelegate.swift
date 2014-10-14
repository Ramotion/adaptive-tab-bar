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
        
        var curentCountLaunches = 10
        
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
        
        
        var watchAppearance = AdaptiveButtonAppearance();
        
        watchAppearance.setButonTitle("watch", state: kDefaultAdaptiveState)
        watchAppearance.setButonTitle("watch", state: kSmallTitleAdaptiveState)
        watchAppearance.setButonTitle("", state: kImageAdaptiveState)
        watchAppearance.setTitleColor(UIColor.whiteColor(), state: kDefaultAdaptiveState)
        
        watchAppearance.setButonTitleFontForState(defaultFont, state: kDefaultAdaptiveState)
        
        watchAppearance.setButonTitleFontForState(defaultSmallTitleModeFont, state: kSmallTitleAdaptiveState)
        
      
        watchAppearance.setImageNamesForStatesImageExtesions("watch", imageExtensionsForState:imageExtensionsForStates)

        
        watchAppearance.setImageInsets(defaultInsets, state: kDefaultAdaptiveState);
        
        watchAppearance.setImageInsets(defaultSmallTitleModeImageInsets, state: kSmallTitleAdaptiveState)
        watchAppearance.setTitleOffset(defaultOffset, state: kDefaultAdaptiveState)
        watchAppearance.setImageInsets(defaultImageModeInsets, state: kImageAdaptiveState);
        
        
        var userAperance = AdaptiveButtonAppearance();
        
       
        userAperance.setAllCommonApperanceFrom(watchAppearance)
       
        userAperance.setButonTitle("user", state: kDefaultAdaptiveState)
        userAperance.setButonTitle("", state: kImageAdaptiveState)
        userAperance.setImageNamesForStatesImageExtesions("man", imageExtensionsForState:imageExtensionsForStates)
       
        
        
        var messageAperance = AdaptiveButtonAppearance();
        
        messageAperance.setAllCommonApperanceFrom((watchAppearance))

        messageAperance.setButonTitle("message", state: kDefaultAdaptiveState)
        messageAperance.setButonTitle("", state: kImageAdaptiveState)
        
        messageAperance.setImageNamesForStatesImageExtesions("messages", imageExtensionsForState:imageExtensionsForStates)
       
       
        
        
        var menuAperance = AdaptiveButtonAppearance();
        
        
        menuAperance.setAllCommonApperanceFrom((watchAppearance))
        
        menuAperance.setButonTitle("dial", state: kDefaultAdaptiveState)
        menuAperance.setButonTitle("", state: kImageAdaptiveState)
        menuAperance.setImageNamesForStatesImageExtesions("menu", imageExtensionsForState:imageExtensionsForStates)
        
        
     
        var moreAperance = AdaptiveButtonAppearance();
        
        moreAperance.setAllCommonApperanceFrom((watchAppearance))
        
        moreAperance.setButonTitle("more", state: kDefaultAdaptiveState)
        moreAperance.setButonTitle("", state: kImageAdaptiveState)
        
        moreAperance.setImageNamesForStatesImageExtesions("more", imageExtensionsForState:imageExtensionsForStates)
      
        
        
        return [watchAppearance ,messageAperance,userAperance,menuAperance,moreAperance]

    }
    
    
}

