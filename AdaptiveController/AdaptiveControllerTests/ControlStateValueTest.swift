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

    func testControlStateAppearance() {
        var appearance = ControlStateAppearance()
        appearance.font = UIFont(name: "Arial", size: 12)
        appearance.title = "2"
        appearance.imageInsets = UIEdgeInsetsMake(2, 2, 2, 2)
        appearance.titleOffset = UIOffsetMake(2, 2)
        appearance.titleColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        appearance.backgroundColor = UIColor(red: 0, green: 7, blue: 0, alpha: 1)
 
        var value = ControlStateValue(valueForNormalState: appearance)
        value.setControlApearence(appearance,state:UIControlState.Normal)
        var object:ControlStateAppearance = value.getControlApearenceFor(UIControlState.Normal)
        
        XCTAssert(object.title! == appearance.title , "Pass")
        
        
    }
    
    
    func testControlStateAppearanceSerialization() {
      
        var appearance = ControlStateAppearance()
        appearance.font = UIFont(name: "Arial", size: 12)
        appearance.title = "2"
        appearance.imageInsets = UIEdgeInsetsMake(2, 2, 2, 2)
        appearance.titleOffset = UIOffsetMake(2, 2)
        appearance.titleColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        appearance.backgroundColor = UIColor(red: 0, green: 7, blue: 0, alpha: 1)
        
        var value = ControlStateValue(valueForNormalState: appearance)
        value.setControlApearence(appearance,state:UIControlState.Normal)
        var object:ControlStateAppearance = value.getControlApearenceFor(UIControlState.Normal)
        
        XCTAssert(object.title! == appearance.title , "Pass")
        
        var value1 = ControlStateValue()
        value1.setObjectDictionary(value.getObjectDictionary())
        var object1:ControlStateAppearance = value.getControlApearenceFor(UIControlState.Normal)
        XCTAssert(object1.title! == appearance.title , "Pass")
        
        
        XCTAssert(appearance.titleColor ==  object1.titleColor, "Fail color")
        
        XCTAssert(appearance.backgroundColor ==  object1.backgroundColor, "Fail color")
        
        XCTAssert(appearance.titleColor ==  object1.titleColor, "Fail color")
        XCTAssert(UIOffsetEqualToOffset(appearance.titleOffset!,object1.titleOffset!), "Fail offset")
        XCTAssert(UIEdgeInsetsEqualToEdgeInsets(appearance.imageInsets!, object1.imageInsets!), "Fail insets")
        
        
    }
    
    
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
