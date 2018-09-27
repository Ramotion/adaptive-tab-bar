//
//  AppDelegate.swift
//  adaptive-tab-bar
//
//  Created by Arcilite on 15.09.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import AdaptiveController
import CoreGraphics
import QuartzCore
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // Override point for customization after application launch.
        UITabBar.appearance().tintColor = tabColor
        UITabBar.appearance().barTintColor = UIColor.clear
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().selectionIndicatorImage = UIImage(named: "backgroud_tab")
        UITabBar.appearance().itemPositioning = UITabBar.ItemPositioning.fill
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: tabColor], for: UIControl.State.selected)
        
        
        let tabBarController: UITabBarController? = window?.rootViewController as? UITabBarController
        let tabBar: UITabBar? = tabBarController?.tabBar
        tabBar?.barTintColor = tabColor
        tabBar?.isTranslucent = false
        tabBar?.clipsToBounds = true
        if #available(iOS 10.0, *) {
            tabBar?.unselectedItemTintColor = UIColor.white
        }
        
        
        //Uncomment one of two adaptive states logic
        //1. Date based logic
        //let installDate = Date(dateString: "2014-07-7")
        //let adaptiveState = AdaptiveDateState(installDate: installDate, currentDate: Date(), countDaysToSmallTextState: countDaysToSmallTextState, countDaysToImageState: countDaysToImageState)
        
        //2. Launches count logic
        let curentLaunch = 1 //update current launc number to watch tab bar adaptation
        let adaptiveState = AdaptiveLaunchesState(curentCountLaunches: curentLaunch, countLaunchesToSmallTextState: countDaysForSmaltextState, countLaunchesToImageState: countDaysForImageModeState)
        
        
        let butonsApperances = buttonsAppearancesGenerate()
        if let arrayButtons = tabBar?.items as? [AdaptiveTabBarItem] {
            AdaptiveButtonsStateManager.configureButtonsState(state: adaptiveState, buttonsAray: arrayButtons, buttonsAppearance: butonsApperances)
        }

        return true
    }

    func buttonsAppearancesGenerate() -> [AdaptiveButtonAppearance] {
        let imageExtensionsForStates: Dictionary = [
            kDefaultAdaptiveState: "",
            kSmallTitleAdaptiveState: "_smalltitle",
            kImageAdaptiveState: "_bigimage",
            kSmallTitleAdaptiveState + selected: "_smalltitle",
            kImageAdaptiveState + selected: "_bigimage",
        ]

        
        let watchApperance = AdaptiveButtonAppearance()
        watchApperance.setButonTitle(title: "watch", state: kDefaultAdaptiveState)
        watchApperance.setButonTitle(title: "watch", state: kSmallTitleAdaptiveState)
        watchApperance.setButonTitle(title: "", state: kImageAdaptiveState)
        watchApperance.setTitleColor(color: UIColor.white, state: kDefaultAdaptiveState)
        watchApperance.setButonTitleFontForState(font: defaultFont, state: kDefaultAdaptiveState)
        watchApperance.setButonTitleFontForState(font: defaultSmallTitleModeFont, state: kSmallTitleAdaptiveState)
        watchApperance.setImageNamesForStatesImageExtesions(imageName: "watch", imageExtensionsForState: imageExtensionsForStates)
        watchApperance.setImageInsets(insets: defaultInsets, state: kDefaultAdaptiveState)
        watchApperance.setImageInsets(insets: defaultSmallTitleModeImageInsets, state: kSmallTitleAdaptiveState)
        watchApperance.setTitleOffset(insets: defaultOffset, state: kDefaultAdaptiveState)
        watchApperance.setImageInsets(insets: defaultImageModeInsets, state: kImageAdaptiveState)

        
        let userApperance = AdaptiveButtonAppearance()
        userApperance.setAllCommonApperanceFrom(adaptiveButtonApperance: watchApperance)
        userApperance.setButonTitle(title: "user", state: kDefaultAdaptiveState)
        userApperance.setButonTitle(title: "", state: kImageAdaptiveState)
        userApperance.setImageNamesForStatesImageExtesions(imageName: "man", imageExtensionsForState: imageExtensionsForStates)

        
        let messageApperance = AdaptiveButtonAppearance()
        messageApperance.setAllCommonApperanceFrom(adaptiveButtonApperance: watchApperance)
        messageApperance.setButonTitle(title: "message", state: kDefaultAdaptiveState)
        messageApperance.setButonTitle(title: "", state: kImageAdaptiveState)
        messageApperance.setImageNamesForStatesImageExtesions(imageName: "messages", imageExtensionsForState: imageExtensionsForStates)

        
        let menuApperance = AdaptiveButtonAppearance()
        menuApperance.setAllCommonApperanceFrom(adaptiveButtonApperance: watchApperance)
        menuApperance.setButonTitle(title: "dial", state: kDefaultAdaptiveState)
        menuApperance.setButonTitle(title: "", state: kImageAdaptiveState)
        menuApperance.setImageNamesForStatesImageExtesions(imageName: "menu", imageExtensionsForState: imageExtensionsForStates)

        
        let moreApperance = AdaptiveButtonAppearance()
        moreApperance.setAllCommonApperanceFrom(adaptiveButtonApperance: watchApperance)
        moreApperance.setButonTitle(title: "more", state: kDefaultAdaptiveState)
        moreApperance.setButonTitle(title: "", state: kImageAdaptiveState)
        moreApperance.setImageNamesForStatesImageExtesions(imageName: "more", imageExtensionsForState: imageExtensionsForStates)

        return [watchApperance, messageApperance, userApperance, menuApperance, moreApperance]
    }
}
