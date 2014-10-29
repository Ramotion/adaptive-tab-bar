//
//  ControlStateValueTest.swift
//  AdaptiveController
//
//  Created by Arcilite on 28.10.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit
import XCTest
import AdaptiveController
class ControlStateValueTest: XCTestCase {

    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        var appearance = ControlStateAppearance()
        appearance.title = "ddd"
        var value = ControlStateValue(valueForNormalState: appearance)
        value.setControlApearence(appearance,state:UIControlState.Normal)
        var object:ControlStateAppearance = value.getControlApearenceFor(UIControlState.Normal)
        
        // This is an example of a functional test case.
      
        XCTAssert(object.title! == appearance.title , "Pass")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
