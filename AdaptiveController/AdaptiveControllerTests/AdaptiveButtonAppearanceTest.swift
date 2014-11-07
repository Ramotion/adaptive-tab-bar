//
//  AdaptiveButtonAppearanceTest.swift
//  AdaptiveController
//
//  Created by Arcilite on 03.11.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//


import XCTest
import UIKit

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
        var imageExtensionsForStates:Dictionary = [ kSmallTitleAdaptiveState:"_smalltitle",
            kImageAdaptiveState:"_bigimage",
            kSmallTitleAdaptiveState+selected :"_smalltitle",
            kImageAdaptiveState+selected:"_bigimage" ]
        
        
        var watchAppearance = AdaptiveButtonAppearance();
        
        watchAppearance.setButonTitle("watch", state: kDefaultAdaptiveState)
        watchAppearance.setButonTitle("watch2", state: kSmallTitleAdaptiveState)
        watchAppearance.setButonTitle("", state: kImageAdaptiveState)
        watchAppearance.setTitleColor(UIColor.whiteColor(), state: kDefaultAdaptiveState)
        watchAppearance.setTitleColor(UIColor.whiteColor(), state: kSmallTitleAdaptiveState)
        watchAppearance.setTitleColor(UIColor.whiteColor(), state: kImageAdaptiveState)
        
        watchAppearance.setButonTitleFontForState(defaultFont!, state: kDefaultAdaptiveState)
        
        watchAppearance.setButonTitleFontForState(defaultSmallTitleModeFont!, state: kSmallTitleAdaptiveState)
        
        
        watchAppearance.setImageInsets(defaultInsets, state: kDefaultAdaptiveState);
        
        watchAppearance.setImageInsets(defaultSmallTitleModeImageInsets, state: kSmallTitleAdaptiveState)
        watchAppearance.setTitleOffset(defaultOffset, state: kDefaultAdaptiveState)
        watchAppearance.setImageInsets(defaultImageModeInsets, state: kImageAdaptiveState);
        
        var appearanceDictionary = watchAppearance.getObjectDictionary()
        
        var testAppearance = AdaptiveButtonAppearance()
        
        testAppearance.setObjectDictionary(appearanceDictionary)
        
       // XCTAssert(testAppearance.getTitleColorForState(kDefaultAdaptiveState) ==  UIColor.whiteColor(), "Fail color")
        XCTAssert(UIOffsetEqualToOffset(testAppearance.getTitleOffsetForState(kDefaultAdaptiveState),defaultOffset), "Fail offset")
        XCTAssert(UIEdgeInsetsEqualToEdgeInsets(defaultInsets, testAppearance.getImageInsetsForState(kDefaultAdaptiveState)), "Fail insets")
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
