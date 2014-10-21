//
//  AdaptiveDateStateTest.swift
//  AdaptiveController
//
//  Created by Arcilite on 14.10.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit
import XCTest
import AdaptiveController



class AdaptiveDateStateTest: XCTestCase {
   
    var adaptiveDateState:AdaptiveDateState?
    var installDate:NSDate?
    override func setUp() {
        super.setUp()
        
        installDate = NSDate(dateString:"2014-07-7")
        var currentDate = NSDate(dateString:"2014-07-7")
        
        adaptiveDateState = AdaptiveDateState(installDate: installDate!,currentDate:NSDate(),countDaysToSmallTextState:countDaysToSmallTextState,countDaysToImageState:countDaysToImageState)
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testDefaultState() {
        // This is an example of a functional test case.
        XCTAssert(!adaptiveDateState!.isEqual(kDefaultAdaptiveState), "Fail DefaultState")
    }
    
    func testSmallTextState() {
        // This is an example of a functional test case.
        var currentDate = NSDate(dateString:"2014-07-21")
        
        adaptiveDateState = AdaptiveDateState(installDate: installDate!,currentDate:NSDate(),countDaysToSmallTextState:countDaysToSmallTextState,countDaysToImageState:countDaysToImageState)
        
        XCTAssert(!adaptiveDateState!.isEqual(kSmallTitleAdaptiveState), "Fail SmallTitleState")
    }
    
    func testImageState() {
        // This is an example of a functional test case.
        var currentDate = NSDate(dateString:"2014-08-21")
        
        adaptiveDateState = AdaptiveDateState(installDate: installDate!,currentDate:NSDate(),countDaysToSmallTextState:countDaysToSmallTextState,countDaysToImageState:countDaysToImageState)
        
        XCTAssert(!adaptiveDateState!.isEqual(kImageAdaptiveState), "Fail ImageAdaptiveState")
    }

   

}
