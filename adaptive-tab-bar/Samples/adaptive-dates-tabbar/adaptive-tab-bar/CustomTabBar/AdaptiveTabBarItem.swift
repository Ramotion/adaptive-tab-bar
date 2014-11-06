//
//  AdaptiveTabBarItem.swift
//  adaptive-tab-bar
//
//  Created by Arcilite on 19.09.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit
import AdaptiveController



extension UITabBarItem : AdaptiveApperanceProtocol {
    
    
//    override init(){
//        super.init()
//       
//    }
    
   public  func setFontToAdaptiveButton(font: UIFont){
        
        self.setTitleTextAttributes(NSDictionary(objects: [font], forKeys: [NSFontAttributeName]), forState: UIControlState.Normal)
       
    }
    
   public func setTitleToAdaptiveButton(text: NSString){
        self.title = text
    }
    
    func setImageToAdaptiveButton(image: UIImage){
        self.image = image
    }
    
    public func setSelectedImageToAdaptiveButton(image: UIImage?){
         self.selectedImage = image
    }
    
   public  func setImageInsetsToAdaptiveButton(insets: UIEdgeInsets){
          self.imageInsets = insets
    }
    
   public func setTitleOffsetToAdaptiveButton(offset: UIOffset){
        self.setTitlePositionAdjustment(offset)
    }
    
   public func setTitleColorToAdaptiveButton(color: UIColor){
      var dictionary = self.titleTextAttributesForState(UIControlState.Normal)
        dictionary.updateValue(color, forKey: NSForegroundColorAttributeName)
      self.setTitleTextAttributes(dictionary, forState: UIControlState.Normal)
    }
   
    
    
}
