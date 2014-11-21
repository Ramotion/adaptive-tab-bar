//
//  AdaptiveButtonAppearanceTest.swift
//  AdaptiveController
//
//  Created by Arcilite on 03.11.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//


import XCTest
import UIKit
import AdaptiveController


class AdaptiveButtonAppearanceTest: XCTestCase {

    func testAppearanceSetup() {
        
        var settingsManager = AppearenceSettingManager()
        //
        settingsManager.defaultStyleSettingsForNormalState(AdaptiveStateEnum.DefaultAdaptiveState,titleOffset:defaultOffset, imageInsets:defaultInsets, titleColor:UIColor(red: 1, green: 1, blue: 1, alpha: 1), font:defaultFont!, backgroundColor:UIColor.clearColor())
        settingsManager.defaultStyleSettingsForNormalState(AdaptiveStateEnum.SmallTitleAdaptiveState,titleOffset:defaultOffset, imageInsets:defaultSmallTitleModeImageInsets, titleColor:UIColor.whiteColor(), font:defaultSmallTitleModeFont!, backgroundColor:UIColor.clearColor())
        
        settingsManager.defaultStyleSettingsForNormalState(AdaptiveStateEnum.ImageAdaptiveState,titleOffset:defaultOffset, imageInsets:defaultImageModeInsets, titleColor:UIColor.whiteColor(), font:defaultFont!, backgroundColor:UIColor.clearColor())
        
        
        
        
        var watchControlDefaultStateValue = settingsManager.defaultStyleValuesForNormalState(AdaptiveStateEnum.DefaultAdaptiveState, title:"watch", imageName:"watch")
        
        var watchControlSmallTitleStateValue = settingsManager.defaultStyleValuesForNormalState(AdaptiveStateEnum.SmallTitleAdaptiveState, title:"watch", imageName:"watch_smalltitle")
        var watchControlImageStateValue = settingsManager.defaultStyleValuesForNormalState(AdaptiveStateEnum.ImageAdaptiveState, title:"", imageName:"watch_bigimage")
        
        let watchAppearanceStates = [AdaptiveStateEnum.DefaultAdaptiveState:watchControlDefaultStateValue,
            AdaptiveStateEnum.SmallTitleAdaptiveState:watchControlSmallTitleStateValue,
            AdaptiveStateEnum.ImageAdaptiveState:watchControlImageStateValue]
        
        
        
        var watchAppearance =   AdaptiveButtonAppearance(states:watchAppearanceStates)
        
      
        
        var appearanceDictionary = watchAppearance.getObjectDictionary()
        
        var testAppearance = AdaptiveButtonAppearance()
        
        testAppearance.setObjectDictionary(appearanceDictionary)
        
        
        if let controlStateValue = testAppearance.stateDictionary[AdaptiveStateEnum.DefaultAdaptiveState]{
        
            if let normalStateAppearenceObject = controlStateValue.controlStates[UIControlState.Normal.rawValue]{
            XCTAssert(normalStateAppearenceObject.titleColor == UIColor(red: 1, green: 1, blue: 1, alpha: 1), "Fail color")
            XCTAssert(UIOffsetEqualToOffset(normalStateAppearenceObject.titleOffset!,defaultOffset), "Fail offset")
            XCTAssert(UIEdgeInsetsEqualToEdgeInsets(defaultInsets, normalStateAppearenceObject.imageInsets!), "Fail insets")
            }
        
            
        }
    }
        
        
            
            
       
        
    

    

}
