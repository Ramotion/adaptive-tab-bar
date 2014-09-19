//
//  AdaptiveTabBarItem.swift
//  adaptive-tab-bar
//
//  Created by Arcilite on 19.09.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit

class AdaptiveTabBarItem: UITabBarItem , AdaptiveButtonsProtocol {
    
    
    func setFontToAdaptiveButton(font: UIFont){
        
        self.setTitleTextAttributes(NSDictionary(objects: [font], forKeys: [NSFontAttributeName]), forState: UIControlState.Normal)
       
    }
    
    func setTitleToAdaptiveButton(text: NSString){
        self.title = text
    }
    
    func setImageToAdaptiveButton(image: UIImage){
        self.image = image
    }
    
    func setHighlightedToAdaptiveButton(image: UIImage){
        
    }
    
    func setBackgroundImageToAdaptiveButton(image: UIImage){
        
    }
    
    func setSelectedImageToAdaptiveButton(image: UIImage){
         self.selectedImage = image
    }
    
    func setImageInsetsToAdaptiveButton(insets: UIEdgeInsets){
          self.imageInsets = insets
    }
    
    func setTitleOffsetToAdaptiveButton(offset: UIOffset){
        self.setTitlePositionAdjustment(offset)
    }
   
}
