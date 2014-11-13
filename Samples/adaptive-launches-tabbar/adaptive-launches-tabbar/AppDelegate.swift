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
        
        var curentCountLaunches = 15
        
        var adaptiveState = AdaptiveLaunchesState(curentCountLaunches:curentCountLaunches,countLaunchesToSmallTextState:countDaysForSmaltextState,countLaunchesToImageState:countDaysForImageModeState)
        
        
        var buttonsAppearances = buttonsAppearancesGenerate()         
     
        var arrayButtons = tabBar.items as [AdaptiveTabBarItem]
       
        AdaptiveButtonsStateManager.setupButtonsAppearanceFromState(adaptiveState,buttonsAray:arrayButtons ,buttonsAppearances: buttonsAppearances)
              
        return true
    }
    
    
    func buttonsAppearancesGenerate() -> [AdaptiveButtonAppearance]{
       
        
        var controlDefaultStyleStateAppearence = ControlStateAppearance()
        controlDefaultStyleStateAppearence.title = "watch"
        controlDefaultStyleStateAppearence.imageName = "watch"
        controlDefaultStyleStateAppearence.titleColor = UIColor.whiteColor()
        controlDefaultStyleStateAppearence.imageInsets = defaultInsets
      
        let controlDefaultStatesValues = [UIControlState.Normal.rawValue:controlDefaultStyleStateAppearence]
        let controlDefaultStateValue =  ControlStateValue(values: controlDefaultStatesValues)
        
      
        
        var controlSmallTitleStyleStateAppearence = ControlStateAppearance(appearanceStyle: controlDefaultStyleStateAppearence)
        controlSmallTitleStyleStateAppearence.font = defaultSmallTitleModeFont
        controlSmallTitleStyleStateAppearence.imageInsets = defaultSmallTitleModeImageInsets
        controlSmallTitleStyleStateAppearence.imageName = "watch_smalltitle"
     
        let controSmallTitleStatesValues = [UIControlState.Normal.rawValue:controlSmallTitleStyleStateAppearence]
        let controlSmallTitleStateValue =  ControlStateValue(values: controSmallTitleStatesValues)
        
       
        
        var controlImageStyleStateAppearence = ControlStateAppearance(appearanceStyle: controlSmallTitleStyleStateAppearence)
        controlImageStyleStateAppearence.imageInsets = defaultImageModeInsets
        controlImageStyleStateAppearence.title = ""
        controlSmallTitleStyleStateAppearence.imageName = "watch_bigimage"
       
        let controlImageStatesValues = [UIControlState.Normal.rawValue:controlImageStyleStateAppearence]
        let controlImageStateValue =  ControlStateValue(values: controlImageStatesValues)
       
        
        let appearanceStates = [AdaptiveStateEnum.DefaultAdaptiveState:controlDefaultStateValue,
                                AdaptiveStateEnum.SmallTitleAdaptiveState:controlSmallTitleStateValue,
                                AdaptiveStateEnum.ImageAdaptiveState:controlImageStateValue]
        
        var watchAppearance =   AdaptiveButtonAppearance(states:appearanceStates)
        
        
        
        var userControlDefaultStyleStateAppearence = ControlStateAppearance(appearanceStyle: controlDefaultStyleStateAppearence)
        userControlDefaultStyleStateAppearence.title = "user"
        userControlDefaultStyleStateAppearence.imageName = "man"
        
        let userСontrolDefaultStatesValues = [UIControlState.Normal.rawValue:userControlDefaultStyleStateAppearence]
        let userСontrolDefaultStateValue =  ControlStateValue(values: userСontrolDefaultStatesValues)
        
        
        
        var userControlSmallTitleStyleStateAppearence = ControlStateAppearance(appearanceStyle: controlDefaultStyleStateAppearence)
       
        userControlSmallTitleStyleStateAppearence.imageName = "man_smalltitle"
        userControlSmallTitleStyleStateAppearence.title = "user"
      
        let userControSmallTitleStatesValues = [UIControlState.Normal.rawValue:userControlSmallTitleStyleStateAppearence]
        let userControlSmallTitleStateValue =  ControlStateValue(values: userControSmallTitleStatesValues)
        
        
        
        var userControlImageStyleStateAppearence = ControlStateAppearance(appearanceStyle: userControlSmallTitleStyleStateAppearence)
        userControlImageStyleStateAppearence.imageName = "man_bigimage"
       
        let userControlImageStatesValues = [UIControlState.Normal.rawValue:userControlImageStyleStateAppearence]
        let userControlImageStateValue =  ControlStateValue(values: userControlImageStatesValues)
        
        
        let userAppearanceStates = [AdaptiveStateEnum.DefaultAdaptiveState:userСontrolDefaultStateValue,
                                    AdaptiveStateEnum.SmallTitleAdaptiveState:userControlSmallTitleStateValue,
                                    AdaptiveStateEnum.ImageAdaptiveState:userControlImageStateValue]
        
        
        var userAperance = AdaptiveButtonAppearance(states:userAppearanceStates)
        
       

        
        var messageAperance = AdaptiveButtonAppearance(states:appearanceStates)
        

    
        
        var menuAperance = AdaptiveButtonAppearance(states:appearanceStates)
        
        
     
        var moreAperance = AdaptiveButtonAppearance(states:appearanceStates)
        

    
        return [watchAppearance ,messageAperance,userAperance,menuAperance,moreAperance]

    }
    
    
}

