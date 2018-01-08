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

        let installDate = Date(dateString: "2014-07-7")

        let adaptiveState = AdaptiveDateState(installDate: installDate, currentDate: Date(), countDaysToSmallTextState: countDaysToSmallTextState, countDaysToImageState: countDaysToImageState)

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

        
        let watchAperance = AdaptiveButtonAppearance()
        watchAperance.setButonTitle(title: "watch", state: kDefaultAdaptiveState)
        watchAperance.setButonTitle(title: "watch", state: kSmallTitleAdaptiveState)
        watchAperance.setButonTitle(title: "", state: kImageAdaptiveState)
        watchAperance.setTitleColor(color: UIColor.white, state: kDefaultAdaptiveState)
        watchAperance.setButonTitleFontForState(font: defaultFont, state: kDefaultAdaptiveState)
        watchAperance.setButonTitleFontForState(font: defaultSmallTitleModeFont, state: kSmallTitleAdaptiveState)
        watchAperance.setImageNamesForStatesImageExtesions(imageName: "watch", imageExtensionsForState: imageExtensionsForStates)
        watchAperance.setImageInsets(insets: defaultInsets, state: kDefaultAdaptiveState)
        watchAperance.setImageInsets(insets: defaultSmallTitleModeImageInsets, state: kSmallTitleAdaptiveState)
        watchAperance.setTitleOffset(insets: defaultOffset, state: kDefaultAdaptiveState)
        watchAperance.setImageInsets(insets: defaultImageModeInsets, state: kImageAdaptiveState)

        
        let userAperance = AdaptiveButtonAppearance()
        userAperance.setAllCommonApperanceFrom(adaptiveButtonApperance: watchAperance)
        userAperance.setButonTitle(title: "user", state: kDefaultAdaptiveState)
        userAperance.setButonTitle(title: "", state: kImageAdaptiveState)
        userAperance.setImageNamesForStatesImageExtesions(imageName: "man", imageExtensionsForState: imageExtensionsForStates)

        
        let messageAperance = AdaptiveButtonAppearance()
        messageAperance.setAllCommonApperanceFrom(adaptiveButtonApperance: watchAperance)
        messageAperance.setButonTitle(title: "message", state: kDefaultAdaptiveState)
        messageAperance.setButonTitle(title: "", state: kImageAdaptiveState)
        messageAperance.setImageNamesForStatesImageExtesions(imageName: "messages", imageExtensionsForState: imageExtensionsForStates)

        
        let menuAperance = AdaptiveButtonAppearance()
        menuAperance.setAllCommonApperanceFrom(adaptiveButtonApperance: watchAperance)
        menuAperance.setButonTitle(title: "dial", state: kDefaultAdaptiveState)
        menuAperance.setButonTitle(title: "", state: kImageAdaptiveState)
        menuAperance.setImageNamesForStatesImageExtesions(imageName: "menu", imageExtensionsForState: imageExtensionsForStates)

        
        let moreAperance = AdaptiveButtonAppearance()
        moreAperance.setAllCommonApperanceFrom(adaptiveButtonApperance: watchAperance)
        moreAperance.setButonTitle(title: "more", state: kDefaultAdaptiveState)
        moreAperance.setButonTitle(title: "", state: kImageAdaptiveState)
        moreAperance.setImageNamesForStatesImageExtesions(imageName: "more", imageExtensionsForState: imageExtensionsForStates)

        return [watchAperance, messageAperance, userAperance, menuAperance, moreAperance]
    }
}
