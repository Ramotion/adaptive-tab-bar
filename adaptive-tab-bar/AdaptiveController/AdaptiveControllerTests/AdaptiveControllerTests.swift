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
    
    var adaptiveDateState:AdaptiveDateState?
    var adaptiveLaunchState:AdaptiveLaunchesState?
    var installDate:NSDate?
    
    override func setUp() {
        super.setUp()
      
         installDate = NSDate(dateString:"2014-07-7")
       
        adaptiveDateState = AdaptiveDateState(installDate: installDate!,currentDate:NSDate(),countDaysToSmallTextState:countDaysToSmallTextState,countDaysToImageState:countDaysToImageState)
        
//        var curentCountLaunches = 0
//        
//        adaptiveLaunchState = bAdaptiveLaunchesState(curentCountLaunches:curentCountLaunches,countLaunchesToSmallTextState:countDaysForSmaltextState,countLaunchesToImageState:countDaysForImageModeState)
//        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDefaultState() {
        // This is an example of a functional test case.
        XCTAssert(!adaptiveDateState!.isEqual(kDefaultAdaptiveState), "Fail DefaultState")
        
        var buttonsAppearances = buttonsAppearancesGenerate()
        var tabBarItem = TestTabBarItem()
        
        tabBarItem.font = defaultFont
        tabBarItem.text = "watch"
        tabBarItem.image = UIImage(named: "watch")
        tabBarItem.insets = defaultInsets
        tabBarItem.color = UIColor.whiteColor()
        tabBarItem.offset = defaultOffset
        
        var arrayButtons = [tabBarItem]
        
        AdaptiveButtonsStateManager(state: adaptiveDateState!,buttonsAray:arrayButtons ,buttonsAppearance: buttonsAppearances)
    
    }
    
    func testSmallTextState() {
        // This is an example of a functional test case.
        var currentDate = NSDate(dateString:"2014-07-21")
        
        adaptiveDateState = AdaptiveDateState(installDate: installDate!,currentDate:NSDate(),countDaysToSmallTextState:countDaysToSmallTextState,countDaysToImageState:countDaysToImageState)
        
        //XCTAssert(!adaptiveDateState!.isEqual(kSmallTitleAdaptiveState), "Fail SmallTitleState")
    }
    
    func testImageState() {
        // This is an example of a functional test case.
        var currentDate = NSDate(dateString:"2014-08-21")
        
        adaptiveDateState = AdaptiveDateState(installDate: installDate!,currentDate:NSDate(),countDaysToSmallTextState:countDaysToSmallTextState,countDaysToImageState:countDaysToImageState)
        
       // XCTAssert(!adaptiveDateState!.isEqual(kImageAdaptiveState), "Fail ImageAdaptiveState")
    }
    
    
    func buttonsAppearancesGenerate() -> [AdaptiveButtonAppearance]{
        
        
        var imageExtensionsForStates:Dictionary = [ kSmallTitleAdaptiveState:"_smalltitle",
            kImageAdaptiveState:"_bigimage",
            kSmallTitleAdaptiveState+selected :"_smalltitle",
            kImageAdaptiveState+selected:"_bigimage" ]
        
        
        var watchAppearance = AdaptiveButtonAppearance();
        
        watchAppearance.setButonTitle("watch", state: kDefaultAdaptiveState)
        watchAppearance.setButonTitle("watch", state: kSmallTitleAdaptiveState)
        watchAppearance.setButonTitle("", state: kImageAdaptiveState)
        watchAppearance.setTitleColor(UIColor.whiteColor(), state: kDefaultAdaptiveState)
        
        watchAppearance.setButonTitleFontForState(defaultFont, state: kDefaultAdaptiveState)
        
        watchAppearance.setButonTitleFontForState(defaultSmallTitleModeFont, state: kSmallTitleAdaptiveState)
        
        
        watchAppearance.setImageNamesForStatesImageExtesions("watch", imageExtensionsForState:imageExtensionsForStates)
        
        
        watchAppearance.setImageInsets(defaultInsets, state: kDefaultAdaptiveState);
        
        watchAppearance.setImageInsets(defaultSmallTitleModeImageInsets, state: kSmallTitleAdaptiveState)
        watchAppearance.setTitleOffset(defaultOffset, state: kDefaultAdaptiveState)
        watchAppearance.setImageInsets(defaultImageModeInsets, state: kImageAdaptiveState);
        
        
        
        
        return [watchAppearance]
        
    }

    
    
    
}
