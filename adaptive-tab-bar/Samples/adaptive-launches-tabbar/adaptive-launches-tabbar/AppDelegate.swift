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

    private func application(application _: UIApplication, didFinishLaunchingWithOptions _: [NSObject: AnyObject]?) -> Bool {

        // Override point for customization after application launch.
        UITabBar.appearance().tintColor = tabColor
        UITabBar.appearance().barTintColor = UIColor.clear
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().selectionIndicatorImage = UIImage(named: "backgroud_tab")
        UITabBar.appearance().itemPositioning = UITabBarItemPositioning.fill
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.white], for: UIControlState.normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: tabColor], for: UIControlState.selected)

        let tabBarController: UITabBarController? = window?.rootViewController as? UITabBarController

        let tabBar: UITabBar? = tabBarController?.tabBar
        tabBar?.barTintColor = tabColor
        tabBar?.clipsToBounds = true

        let curentCountLaunches = 10
        let adaptiveState = AdaptiveLaunchesState(curentCountLaunches: curentCountLaunches, countLaunchesToSmallTextState: countDaysForSmaltextState, countLaunchesToImageState: countDaysForImageModeState)
        let buttonsAppearances = buttonsAppearancesGenerate()

        if let arrayButtons = tabBar?.items as? [AdaptiveTabBarItem] {
            AdaptiveButtonsStateManager.configureButtonsState(state: adaptiveState, buttonsAray: arrayButtons, buttonsAppearance: buttonsAppearances)
        }

        return true
    }

    func buttonsAppearancesGenerate() -> [AdaptiveButtonAppearance] {

        let imageExtensionsForStates: Dictionary = [
            kSmallTitleAdaptiveState: "_smalltitle",
            kImageAdaptiveState: "_bigimage",
            kSmallTitleAdaptiveState + selected: "_smalltitle",
            kImageAdaptiveState + selected: "_bigimage",
        ]

        
        let watchAppearance = AdaptiveButtonAppearance()
        watchAppearance.setButonTitle(title: "watch", state: kDefaultAdaptiveState)
        watchAppearance.setButonTitle(title: "watch", state: kSmallTitleAdaptiveState)
        watchAppearance.setButonTitle(title: "", state: kImageAdaptiveState)
        watchAppearance.setTitleColor(color: UIColor.white, state: kDefaultAdaptiveState)
        watchAppearance.setButonTitleFontForState(font: defaultFont, state: kDefaultAdaptiveState)
        watchAppearance.setButonTitleFontForState(font: defaultSmallTitleModeFont, state: kSmallTitleAdaptiveState)
        watchAppearance.setImageNamesForStatesImageExtesions(imageName: "watch", imageExtensionsForState: imageExtensionsForStates)
        watchAppearance.setImageInsets(insets: defaultInsets, state: kDefaultAdaptiveState)
        watchAppearance.setImageInsets(insets: defaultSmallTitleModeImageInsets, state: kSmallTitleAdaptiveState)
        watchAppearance.setTitleOffset(insets: defaultOffset, state: kDefaultAdaptiveState)
        watchAppearance.setImageInsets(insets: defaultImageModeInsets, state: kImageAdaptiveState)

        
        let userAperance = AdaptiveButtonAppearance()
        userAperance.setAllCommonApperanceFrom(adaptiveButtonApperance: watchAppearance)
        userAperance.setButonTitle(title: "user", state: kDefaultAdaptiveState)
        userAperance.setButonTitle(title: "", state: kImageAdaptiveState)
        userAperance.setImageNamesForStatesImageExtesions(imageName: "man", imageExtensionsForState: imageExtensionsForStates)

        
        let messageAperance = AdaptiveButtonAppearance()
        messageAperance.setAllCommonApperanceFrom(adaptiveButtonApperance: watchAppearance)
        messageAperance.setButonTitle(title: "message", state: kDefaultAdaptiveState)
        messageAperance.setButonTitle(title: "", state: kImageAdaptiveState)
        messageAperance.setImageNamesForStatesImageExtesions(imageName: "messages", imageExtensionsForState: imageExtensionsForStates)

        
        let menuAperance = AdaptiveButtonAppearance()
        menuAperance.setAllCommonApperanceFrom(adaptiveButtonApperance: watchAppearance)
        menuAperance.setButonTitle(title: "dial", state: kDefaultAdaptiveState)
        menuAperance.setButonTitle(title: "", state: kImageAdaptiveState)
        menuAperance.setImageNamesForStatesImageExtesions(imageName: "menu", imageExtensionsForState: imageExtensionsForStates)

        
        let moreAperance = AdaptiveButtonAppearance()
        moreAperance.setAllCommonApperanceFrom(adaptiveButtonApperance: watchAppearance)
        moreAperance.setButonTitle(title: "more", state: kDefaultAdaptiveState)
        moreAperance.setButonTitle(title: "", state: kImageAdaptiveState)
        moreAperance.setImageNamesForStatesImageExtesions(imageName: "more", imageExtensionsForState: imageExtensionsForStates)

        return [watchAppearance, messageAperance, userAperance, menuAperance, moreAperance]
    }
}
