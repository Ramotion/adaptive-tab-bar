//
//  AdaptiveControllerTests.swift
//  AdaptiveControllerTests
//
//  Created by Arcilite on 24.09.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit
import XCTest
import AdaptiveController



class AdaptiveControllerTests: XCTestCase {
    
    class MockUIImage: UIImage {
        var checkImageString:String?
        
        
    }
    
    override func setUp() {
        super.setUp()
      
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDefaultState() {
        // This is an example of a functional test case.
        var installDate = NSDate(dateString:"2014-07-7")
        var currentDate = NSDate(dateString:"2014-07-7")
        
        var adaptiveDateState = AdaptiveDateState(installDate: installDate,currentDate:currentDate,countDaysToSmallTextState:countDaysToSmallTextState,countDaysToImageState:countDaysToImageState)
        
        var buttonsAppearances = buttonsAppearancesGenerate()
        var tabBarItem = TestTabBarItem()
        
       
        
        
        var arrayButtons = [tabBarItem]
        
        AdaptiveButtonsStateManager.setupButtonsAppearanceFromState(adaptiveDateState,buttonsAray:arrayButtons ,buttonsAppearances: buttonsAppearances)
        //assert
        
    
        XCTAssert(tabBarItem.color!.isEqual(UIColor.whiteColor()), "Fail color")
        XCTAssert(UIOffsetEqualToOffset(tabBarItem.offset!,defaultOffset), "Fail offset")
        XCTAssert(UIEdgeInsetsEqualToEdgeInsets(defaultInsets, tabBarItem.insets!), "Fail insets")
         let bundle = NSBundle(forClass: AdaptiveButtonAppearance.self)
      //  var image:MockUIImage = tabBarItem.image as MockUIImage
        //XCTAssert(image.checkImageString!.isEqual("default Image"), "Fail  image")
        XCTAssert(tabBarItem.text!.isEqualToString("watch"), "Fail  text")
        XCTAssert(tabBarItem.font!.isEqual(defaultFont), "Fail  font")
    }
    
    func testSmallTextState() {
        // This is an example of a functional test case.
        var installDate = NSDate(dateString:"2014-07-7")
        var currentDate = NSDate(dateString:"2014-07-21")
        
        var adaptiveDateState = AdaptiveDateState(installDate: installDate,currentDate:currentDate,countDaysToSmallTextState:countDaysToSmallTextState,countDaysToImageState:countDaysToImageState)
        
     //   XCTAssert(!adaptiveDateState.isEqual(kSmallTitleAdaptiveState), "Fail SmallTitleState")
        
        var buttonsAppearances = buttonsAppearancesGenerate()
        var tabBarItem = TestTabBarItem()
        
        
        var arrayButtons = [tabBarItem]
        
       // AdaptiveButtonsStateManager(state: adaptiveDateState,buttonsAray:arrayButtons ,buttonsAppearance: buttonsAppearances)
        AdaptiveButtonsStateManager.setupButtonsAppearanceFromState(adaptiveDateState,buttonsAray:arrayButtons ,buttonsAppearances: buttonsAppearances)
        
        XCTAssert(tabBarItem.color!.isEqual(UIColor.whiteColor()), "Fail color")
        XCTAssert(UIOffsetEqualToOffset(tabBarItem.offset!,defaultOffset), "Fail offset")
        XCTAssert(UIEdgeInsetsEqualToEdgeInsets(defaultInsets, tabBarItem.insets!), "Fail insets")
        //var image:MockUIImage = tabBarItem.image as MockUIImage
        //XCTAssert(image.checkImageString!.isEqual("smalltitle Image"), "Fail  image")
        
        XCTAssert(tabBarItem.font!.isEqual(defaultSmallTitleModeFont), "Fail  font")
    }
    
    func testImageState() {
        // This is an example of a functional test case.
        var installDate = NSDate(dateString:"2014-07-7")
        var currentDate = NSDate(dateString:"2014-08-21")
        
        var adaptiveDateState = AdaptiveDateState(installDate: installDate,currentDate:currentDate,countDaysToSmallTextState:countDaysToSmallTextState,countDaysToImageState:countDaysToImageState)
        
        //XCTAssert(!adaptiveDateState.isEqual(kImageAdaptiveState), "Fail ImageAdaptiveState")
        
        var buttonsAppearances = buttonsAppearancesGenerate()
        var tabBarItem = TestTabBarItem()
        
        
        var arrayButtons = [tabBarItem]
        
       // AdaptiveButtonsStateManager(state: adaptiveDateState,buttonsAray:arrayButtons ,buttonsAppearance: buttonsAppearances)
         AdaptiveButtonsStateManager.setupButtonsAppearanceFromState(adaptiveDateState,buttonsAray:arrayButtons ,buttonsAppearances: buttonsAppearances)
        
         XCTAssert(tabBarItem.color!.isEqual(UIColor.whiteColor()), "Fail color")
         XCTAssert(UIOffsetEqualToOffset(tabBarItem.offset!,defaultOffset), "Fail offset")
         XCTAssert(UIEdgeInsetsEqualToEdgeInsets(defaultImageModeInsets, tabBarItem.insets!), "Fail insets")
       // var image:MockUIImage = tabBarItem.image as MockUIImage
        // XCTAssert(image.checkImageString!.isEqual("big Image"), "Fail  image")
         XCTAssert(tabBarItem.text!.isEqualToString(""), "Fail  text")
         XCTAssert(tabBarItem.font!.isEqual(defaultFont), "Fail  font")
    }
    
    
    func buttonsAppearancesGenerate() -> [AdaptiveButtonAppearance]{
        
        
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
        
        
        return [watchAppearance]
        
    }

    
    
    
}
