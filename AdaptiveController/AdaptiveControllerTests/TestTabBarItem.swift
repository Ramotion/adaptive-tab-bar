//
//  TestTabBarItem.swift
//  AdaptiveController
//
//  Created by Arcilite on 17.10.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import Foundation
import UIKit
import AdaptiveController
import XCTest

public class TestTabBarItem:   AdaptiveApperanceProtocol {
    
    var font:UIFont?
    var text:NSString?
    var image:UIImage?
    var selectedImage:UIImage?
    var insets:UIEdgeInsets?
    var color:UIColor?
    var offset :UIOffset?
    
    init(){
        
    }
    
    func setFontToAdaptiveButton(font: UIFont){
 
        self.font = font
    }
    
    public func setTitleToAdaptiveButton(text: NSString){
        
        self.text = text;
         
    }
    
    public func setImageToAdaptiveButton(image: UIImage?){
       // XCTAssertNotNil(image)
        self.image = image
        
    }
    
    func setSelectedImageToAdaptiveButton(image: UIImage){
        self.selectedImage = image;
        
    }
    
    public func setImageInsetsToAdaptiveButton(insets: UIEdgeInsets){
        self.insets = insets
       
    }
    
    public func setTitleOffsetToAdaptiveButton(offset: UIOffset){
      
        self.offset = offset;
       
    }
    
    func setTitleColorToAdaptiveButton(color: UIColor){
        self.color = color;
      
    }
    
    
    public func setFontToAdaptiveButton(font: UIFont , controlState:UIControlState){
        
        self.font = font
    }
    
    public func setTitleColorToAdaptiveButton(color: UIColor, controlState:UIControlState){
         self.color = color;
    }
    
    
}