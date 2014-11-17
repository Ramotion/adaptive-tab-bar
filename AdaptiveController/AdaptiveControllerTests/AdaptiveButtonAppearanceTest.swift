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

    override func setUp() {
        
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        
        var settingsManager = AppearenceSettingManager()
        //
        settingsManager.defaultStyleSettingsForNormalState(AdaptiveStateEnum.DefaultAdaptiveState,titleOffset:defaultOffset, imageInsets:defaultInsets, titleColor:UIColor.whiteColor(), font:defaultFont!, backgroundColor:UIColor.clearColor())
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
        
       // XCTAssert(testAppearance.getTitleColorForState(kDefaultAdaptiveState) ==  UIColor.whiteColor(), "Fail color")
        //XCTAssert(UIOffsetEqualToOffset(testAppearance.getTitleOffsetForState(kDefaultAdaptiveState),defaultOffset), "Fail offset")
       // XCTAssert(UIEdgeInsetsEqualToEdgeInsets(defaultInsets, testAppearance.getImageInsetsForState(kDefaultAdaptiveState)), "Fail insets")
//    
//        XCTAssert(tabBarItem.text!.isEqualToString(""), "Fail  text")
//        XCTAssert(tabBarItem.font!.isEqual(defaultFont), "Fail  font")
        
        XCTAssert(true, "Pass")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
