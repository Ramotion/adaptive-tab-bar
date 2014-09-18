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
//struct UIEdgeInsets { var top: CGFloat var left: CGFloat var bottom: CGFloat var right: CGFloat }





//extension UITabBar{
//    
//    
//    func  launchDefaultTabBarAdaptivity(startDate:NSDate){
//        
//        let todayDate = NSDate()
//        
//        self.launchTabBarAdaptivity(startDate,currentDate:todayDate,smallTitleModeFont:defaultSmallTitleModeFont,smallTitleModeImageInsets:defaultSmallTitleModeImageInsets,imageModeInsets:defaultImageModeInsets,smallTitleModeOffset:defaultSmallTitleModeOffset,daysForSmallTitleMode:twoWeaks,daysForImageMode:month)
//
//    }
//    
//    func  launchTabBarAdaptivity(startDate:NSDate,currentDate:NSDate,smallTitleModeFont: UIFont,smallTitleModeImageInsets:UIEdgeInsets,imageModeInsets:UIEdgeInsets,smallTitleModeOffset:UIOffset,daysForSmallTitleMode:Double,daysForImageMode:Double ){
//        
//        var currentDate = NSDate()
//       
//       
//        var days =  Double(currentDate.daysBetween(startDate,dayTo:currentDate))
//        
//        
//        if days > daysForSmallTitleMode && days < daysForImageMode{
//          
//            self.setTabItems(smallTitleModeFont , state:UIControlState.Normal,imageInsets:smallTitleModeImageInsets,offset:smallTitleModeOffset)
//        
//        }else if days > daysForImageMode{
//            self.setTabItems(smallTitleModeFont , state:UIControlState.Normal,imageInsets:imageModeInsets,offset:UIOffsetMake(0,-20))
//        }
//        
//        
//    }
//    
//    
//    func setTabItems(font:UIFont,state: UIControlState,imageInsets:UIEdgeInsets,offset:UIOffset){
//        
//        for item  in self.items!{
//            var itemTabBar: UITabBarItem = item as UITabBarItem
//            
//            item.setTitleTextAttributes(NSDictionary(objects: [font], forKeys: [NSFontAttributeName]), forState: state)
//            itemTabBar.setTitlePositionAdjustment(offset)
//            itemTabBar.imageInsets = imageInsets
//           // itemTabBar.layer
//        }
//        
//    }
//    
//}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        var tabBarController:UITabBarController = self.window?.rootViewController as UITabBarController
        
        var tabBar:UITabBar = tabBarController.tabBar
        
        var installDate = NSDate(dateString:"2014-09-01")

        var imagesArray:Array<String> = ["watch","man"]
        
        tabBar.launchTabBarAdaptivityForDateSettings(TimeSettingsObject(startDate: installDate),itemSettings: AdaptiveTabBarSettingsObject(imagesArray: imagesArray ) )
        
        
        
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

