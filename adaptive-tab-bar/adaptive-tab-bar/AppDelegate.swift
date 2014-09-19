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

let defaultFont = UIFont(name: "Helvetica", size: 14.0)
let defaultSmallTitleModeFont = UIFont(name: "Helvetica", size: 10.0)
let defaultSmallTitleModeImageInsets = UIEdgeInsetsMake(6,  0,  -6,  0)
let defaultImageModeInsets = UIEdgeInsetsMake(-3, -8,-13, -8)
let defaultSmallTitleModeOffset = UIOffsetMake(0, -2)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        var tabBarController:UITabBarController = self.window?.rootViewController as UITabBarController
        
        var tabBar:UITabBar = tabBarController.tabBar
        
        var installDate = NSDate(dateString:"2014-09-01")

        var imagesArray:Array<String> = ["watch","man"]
        
       
        var adaptiveState = AdaptiveDateState(installDate: installDate,currentDate:NSDate(),countDaysToSmallTextState:countDaysToSmallTextState,countDaysToImageState:countDaysToImageState)
        
        var watchAperance = AdaptiveButtonApperance();
        
        watchAperance.setButonTitle("watch", state: kDefaultAdaptiveState)
        watchAperance.setButonTitle("watch", state: kSmallTitleAdaptiveState)
        watchAperance.setButonTitle("watch", state: kImageAdaptiveState)
        
        watchAperance.setButonTitleFontForState(defaultFont, state: kDefaultAdaptiveState)
        watchAperance.setButonTitleFontForState(defaultSmallTitleModeFont, state: kSmallTitleAdaptiveState)
        
        watchAperance.setButonTitle("watch", state: kSmallTitleAdaptiveState)
        watchAperance.setButonTitle("watch", state: kSmallTitleAdaptiveState)
        
        watchAperance.setButtonImage(UIImage(named: "watch"), state: kDefaultAdaptiveState)
        watchAperance.setButtonImage(UIImage(named: "watch"), state: kSmallTitleAdaptiveState)
        watchAperance.setButtonImage(UIImage(named: "watch"), state: kImageAdaptiveState)
       
        watchAperance.setBackgroundButonImage(UIImage(named: " "), state: kSmallTitleAdaptiveState)
     
        
        watchAperance.setImageInsets(defaultSmallTitleModeImageInsets, state: kDefaultAdaptiveState);
        watchAperance.setImageInsets(defaultSmallTitleModeImageInsets, state: kSmallTitleAdaptiveState);
        
        watchAperance.setTitleOffset(defaultSmallTitleModeOffset, state: kDefaultAdaptiveState)
        
        
        var userAperance = AdaptiveButtonApperance();
        
        userAperance.setButonTitle("watch", state: kDefaultAdaptiveState)
        userAperance.setButonTitle("watch", state: kSmallTitleAdaptiveState)
        userAperance.setButonTitle("watch", state: kImageAdaptiveState)
        
        userAperance.setButonTitleFontForState(defaultFont, state: kDefaultAdaptiveState)
        userAperance.setButonTitleFontForState(defaultSmallTitleModeFont, state: kSmallTitleAdaptiveState)
        
        userAperance.setButonTitle("watch", state: kSmallTitleAdaptiveState)
        userAperance.setButonTitle("watch", state: kSmallTitleAdaptiveState)
        
        userAperance.setButtonImage(UIImage(named: "watch"), state: kDefaultAdaptiveState)
        userAperance.setButtonImage(UIImage(named: "watch"), state: kSmallTitleAdaptiveState)
        userAperance.setButtonImage(UIImage(named: "watch"), state: kImageAdaptiveState)
        
        userAperance.setBackgroundButonImage(UIImage(named: " "), state: kSmallTitleAdaptiveState)
        
        
        userAperance.setImageInsets(defaultSmallTitleModeImageInsets, state: kDefaultAdaptiveState);
        userAperance.setImageInsets(defaultSmallTitleModeImageInsets, state: kSmallTitleAdaptiveState);
        
        userAperance.setTitleOffset(defaultSmallTitleModeOffset, state: kDefaultAdaptiveState)
        
        var arrayApperance = [watchAperance ,userAperance]
        
     
        var arrayButtons = tabBar.items as [AdaptiveTabBarItem]
        AdaptiveButtonsStateManager(state: adaptiveState,buttonsAray:arrayButtons ,buttonsApperance: arrayApperance)
        
        
        //tabBar.launchTabBarAdaptivityForDateSettings(TimeSettingsObject(startDate: installDate),itemSettings: AdaptiveTabBarSettingsObject(imagesArray: imagesArray ) )
        
        
        
        tabBar.barTintColor = UIColor(red: 169/255, green: 79/255, blue: 152/255, alpha: 1.0)

        return true
    }
    
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

