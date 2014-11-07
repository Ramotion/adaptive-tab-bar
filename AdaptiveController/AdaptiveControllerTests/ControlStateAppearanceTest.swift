//
//  ControlStateAppearanceTest.swift
//  AdaptiveController
//
//  Created by Arcilite on 01.11.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit
import XCTest
import AdaptiveController

//extension ControlStateAppearance{
//    
//    public func getObjectDictionary() -> Dictionary<String,AnyObject>{
//        return getObjectDictionary()
//    }
//    public func setObjectDictionary(dictionary:Dictionary<String,AnyObject>){
//         setObjectDictionary(dictionary)
//    }
//}

class ControlStateAppearanceTest: XCTestCase {

    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testControlstateAppearance() {
        
        var appearance = ControlStateAppearance();
        appearance.font = UIFont(name: "Arial", size: 12)
        appearance.title = "2"
        appearance.imageInsets = UIEdgeInsetsMake(2, 2, 2, 2)
        appearance.titleOffset = UIOffsetMake(2, 2)
        appearance.titleColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        appearance.backgroundColor = UIColor(red: 0, green: 7, blue: 0, alpha: 1)
        
        var appearance1 = ControlStateAppearance();
        appearance1.setObjectDictionary( appearance.getObjectDictionary())
        
     
        
        XCTAssert(appearance.titleColor ==  appearance1.titleColor, "Fail color")
        
        XCTAssert(appearance.backgroundColor ==  appearance1.backgroundColor, "Fail color")
        
        XCTAssert(appearance1.titleColor ==  appearance.titleColor, "Fail color")
        XCTAssert(UIOffsetEqualToOffset(appearance1.titleOffset!,appearance.titleOffset!), "Fail offset")
        XCTAssert(UIEdgeInsetsEqualToEdgeInsets(appearance.imageInsets!, appearance1.imageInsets!), "Fail insets")
        
        
        // XCTAssert(tabBarItem.font!.isEqual(defaultSmallTitleModeFont), "Fail  font")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
