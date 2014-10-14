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
    var adaptiveLaunchState:AdaptiveDateState?
    
    override func setUp() {
        super.setUp()
      
        var installDate = NSDate(dateString:"2014-07-7")
        
        adaptiveDateState = AdaptiveDateState(installDate: installDate,currentDate:NSDate(),countDaysToSmallTextState:countDaysToSmallTextState,countDaysToImageState:countDaysToImageState)
        
        var curentCountLaunches = 10
        
       // adaptiveLaunchState = AdaptiveLaunchesState(curentCountLaunches:curentCountLaunches,countLaunchesToSmallTextState:countDaysForSmaltextState,countLaunchesToImageState:countDaysForImageModeState)
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
       // AdaptiveButtonsStateManager(state: adaptiveState,buttonsAray:arrayButtons ,buttonsAppearance: buttonsAppearances)
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
