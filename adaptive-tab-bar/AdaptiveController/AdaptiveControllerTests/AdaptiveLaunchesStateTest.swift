//
//  AdaptiveLaunchesState.swift
//  AdaptiveController
//
//  Created by Arcilite on 14.10.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit
import XCTest
import AdaptiveController
class AdaptiveLaunchesStateTest: XCTestCase {

    var adaptiveLaunchState:AdaptiveLaunchesState?
    
    override func setUp() {
        super.setUp()
//           adaptiveDateState = AdaptiveDateState(installDate: installDate,currentDate:NSDate(),countDaysToSmallTextState:countDaysToSmallTextState,countDaysToImageState:countDaysToImageState)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testDefaultState() {
        
        var curentCountLaunches = 0
        
        adaptiveLaunchState = AdaptiveLaunchesState(curentCountLaunches:curentCountLaunches,countLaunchesToSmallTextState:countDaysForSmaltextState,countLaunchesToImageState:countDaysForImageModeState)
        // This is an example of a functional test case.
        XCTAssert(!adaptiveLaunchState!.isEqual(kDefaultAdaptiveState), "Fail DefaultState")
    }
    
    func testSmallTextState() {
        // This is an example of a functional test case.
        var curentCountLaunches = 5
        
        adaptiveLaunchState = AdaptiveLaunchesState(curentCountLaunches:curentCountLaunches,countLaunchesToSmallTextState:countDaysForSmaltextState,countLaunchesToImageState:countDaysForImageModeState)
        
        XCTAssert(!adaptiveLaunchState!.isEqual(kSmallTitleAdaptiveState), "Fail SmallTitleState")
    }
    
    func testImageState() {
        // This is an example of a functional test case.
        var curentCountLaunches = 7
        
        adaptiveLaunchState = AdaptiveLaunchesState(curentCountLaunches:curentCountLaunches,countLaunchesToSmallTextState:countDaysForSmaltextState,countLaunchesToImageState:countDaysForImageModeState)
        
        XCTAssert(!adaptiveLaunchState!.isEqual(kImageAdaptiveState), "Fail ImageAdaptiveState")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
