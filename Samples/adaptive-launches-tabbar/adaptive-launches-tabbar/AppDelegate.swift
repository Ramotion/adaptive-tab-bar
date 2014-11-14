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
        
        var curentCountLaunches = 1
        
        var adaptiveState = AdaptiveLaunchesState(curentCountLaunches:curentCountLaunches,countLaunchesToSmallTextState:countDaysForSmaltextState,countLaunchesToImageState:countDaysForImageModeState)
        
        
        var buttonsAppearances = buttonsAppearancesGenerate()         
     
        var arrayButtons = tabBar.items as [AdaptiveTabBarItem]
       
        AdaptiveButtonsStateManager.setupButtonsAppearanceFromState(adaptiveState,buttonsAray:arrayButtons ,buttonsAppearances: buttonsAppearances)
              
        return true
    }
    
    
    func buttonsAppearancesGenerate() -> [AdaptiveButtonAppearance]{
       
        
        var controlDefaultStyleStateAppearence = ControlStateAppearance()
    
        controlDefaultStyleStateAppearence.titleColor = UIColor.whiteColor()
        controlDefaultStyleStateAppearence.imageInsets = defaultInsets
      
        let controlDefaultStatesValues = [UIControlState.Normal.rawValue:controlDefaultStyleStateAppearence]
        let controlDefaultStateValue =  ControlStateValue(values: controlDefaultStatesValues)
        
      
        
        var controlSmallTitleStyleStateAppearence = ControlStateAppearance(appearanceStyle: controlDefaultStyleStateAppearence)
        controlSmallTitleStyleStateAppearence.font = defaultSmallTitleModeFont
        controlSmallTitleStyleStateAppearence.imageInsets = defaultSmallTitleModeImageInsets
        
        let controSmallTitleStatesValues = [UIControlState.Normal.rawValue:controlSmallTitleStyleStateAppearence]
        let controlSmallTitleStateValue =  ControlStateValue(values: controSmallTitleStatesValues)
        
       
        
        var controlImageStyleStateAppearence = ControlStateAppearance(appearanceStyle: controlSmallTitleStyleStateAppearence)
        controlImageStyleStateAppearence.imageInsets = defaultImageModeInsets
        controlImageStyleStateAppearence.title = ""
       
        let controlImageStatesValues = [UIControlState.Normal.rawValue:controlImageStyleStateAppearence]
        let controlImageStateValue =  ControlStateValue(values: controlImageStatesValues)
        
        let appearanceStates = [AdaptiveStateEnum.DefaultAdaptiveState:controlDefaultStateValue,
            AdaptiveStateEnum.SmallTitleAdaptiveState:controlSmallTitleStateValue,
            AdaptiveStateEnum.ImageAdaptiveState:controlImageStateValue]
        
        var settingsManager = AppearenceSettingManager(stylesAppearances:appearanceStates)
        
        
        var watchControlDefaultStateValue = settingsManager.defaultStyleValuesForNormalState(AdaptiveStateEnum.DefaultAdaptiveState, title:"watch", imageName:"watch")
        
        var watchControlSmallTitleStateValue = settingsManager.defaultStyleValuesForNormalState(AdaptiveStateEnum.DefaultAdaptiveState, title:"watch", imageName:"watch_smalltitle")
        var watchControlImageStateValue = settingsManager.defaultStyleValuesForNormalState(AdaptiveStateEnum.DefaultAdaptiveState, title:"watch", imageName:"watch_smalltitle")
        
        let watchAppearanceStates = [AdaptiveStateEnum.DefaultAdaptiveState:watchControlDefaultStateValue,
            AdaptiveStateEnum.SmallTitleAdaptiveState:watchControlSmallTitleStateValue,
            AdaptiveStateEnum.ImageAdaptiveState:watchControlImageStateValue]
        
       
        
        var watchAppearance =   AdaptiveButtonAppearance(states:watchAppearanceStates)
        
        
        
        var userСontrolDefaultStateValue = settingsManager.defaultStyleValuesForNormalState(AdaptiveStateEnum.DefaultAdaptiveState, title:"user", imageName:"man")
        
        var userControlSmallTitleStateValue = settingsManager.defaultStyleValuesForNormalState(AdaptiveStateEnum.DefaultAdaptiveState, title:"user", imageName:"man_smalltitle")
      
        var userControlImageStateValue = settingsManager.defaultStyleValuesForNormalState(AdaptiveStateEnum.DefaultAdaptiveState, title:"", imageName:"man_smalltitle")
        
        let userappearanceStates = [AdaptiveStateEnum.DefaultAdaptiveState:watchControlDefaultStateValue,
            AdaptiveStateEnum.SmallTitleAdaptiveState:watchControlSmallTitleStateValue,
            AdaptiveStateEnum.ImageAdaptiveState:watchControlImageStateValue]
        
        

        
        let userAppearanceStates = [AdaptiveStateEnum.DefaultAdaptiveState:userСontrolDefaultStateValue,
                                    AdaptiveStateEnum.SmallTitleAdaptiveState:userControlSmallTitleStateValue,
                                    AdaptiveStateEnum.ImageAdaptiveState:userControlImageStateValue]
        

        
        var userAperance = AdaptiveButtonAppearance(states:userAppearanceStates)
        
        
        
        var messageСontrolDefaultStateValue = settingsManager.defaultStyleValuesForNormalState(AdaptiveStateEnum.DefaultAdaptiveState, title:"messages", imageName:"messages")
        
        var messageControlSmallTitleStateValue = settingsManager.defaultStyleValuesForNormalState(AdaptiveStateEnum.DefaultAdaptiveState, title:"messages", imageName:"messages_smalltitle")
        
        var messageControlImageStateValue = settingsManager.defaultStyleValuesForNormalState(AdaptiveStateEnum.DefaultAdaptiveState, title:"", imageName:"messages_bigimage")
        
        
        let messageAppearanceStates = [AdaptiveStateEnum.DefaultAdaptiveState:messageСontrolDefaultStateValue,
            AdaptiveStateEnum.SmallTitleAdaptiveState:messageControlSmallTitleStateValue,
            AdaptiveStateEnum.ImageAdaptiveState:messageControlImageStateValue]
        
        var messageAperance = AdaptiveButtonAppearance(states:messageAppearanceStates)
        
        
        
        
        
        var menuСontrolDefaultStateValue = settingsManager.defaultStyleValuesForNormalState(AdaptiveStateEnum.DefaultAdaptiveState, title:"dial", imageName:"menu")
        
        var menuControlSmallTitleStateValue = settingsManager.defaultStyleValuesForNormalState(AdaptiveStateEnum.DefaultAdaptiveState, title:"dial", imageName:"menu_smalltitle")
        
        var menuControlImageStateValue = settingsManager.defaultStyleValuesForNormalState(AdaptiveStateEnum.DefaultAdaptiveState, title:"", imageName:"menu_bigimage")
        
        
        
        let menuAppearanceStates = [AdaptiveStateEnum.DefaultAdaptiveState:menuСontrolDefaultStateValue,
            AdaptiveStateEnum.SmallTitleAdaptiveState:menuControlSmallTitleStateValue,
            AdaptiveStateEnum.ImageAdaptiveState:menuControlImageStateValue]

    
        
        var menuAperance = AdaptiveButtonAppearance(states:menuAppearanceStates)
        
        
        var moreСontrolDefaultStateValue = settingsManager.defaultStyleValuesForNormalState(AdaptiveStateEnum.DefaultAdaptiveState, title:"more", imageName:"more")
        
        var moreControlSmallTitleStateValue = settingsManager.defaultStyleValuesForNormalState(AdaptiveStateEnum.DefaultAdaptiveState, title:"more", imageName:"more_smalltitle")
        
        var moreControlImageStateValue = settingsManager.defaultStyleValuesForNormalState(AdaptiveStateEnum.DefaultAdaptiveState, title:"", imageName:"more_bigimage")
        
        
        
        let moreAppearanceStates = [AdaptiveStateEnum.DefaultAdaptiveState:moreСontrolDefaultStateValue,
            AdaptiveStateEnum.SmallTitleAdaptiveState:moreControlSmallTitleStateValue,
            AdaptiveStateEnum.ImageAdaptiveState:moreControlImageStateValue]
        
        var moreAperance = AdaptiveButtonAppearance(states:moreAppearanceStates)
        

    
        return [watchAppearance ,messageAperance,userAperance,menuAperance,moreAperance]

    }
    
    
}

