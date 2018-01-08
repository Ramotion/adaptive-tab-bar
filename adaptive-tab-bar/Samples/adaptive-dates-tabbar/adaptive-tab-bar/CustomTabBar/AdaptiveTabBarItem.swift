//
//  AdaptiveTabBarItem.swift
//  adaptive-tab-bar
//
//  Created by Arcilite on 19.09.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import AdaptiveController
import UIKit

class AdaptiveTabBarItem: UITabBarItem, AdaptiveApperanceProtocol {

    override init() {
        super.init()
    }

    func setFontToAdaptiveButton(font: UIFont) {

        setTitleTextAttributes(NSDictionary(objects: [font], forKeys: [NSFontAttributeName]), forState: UIControlState.Normal)
    }

    func setTitleToAdaptiveButton(text: NSString) {
        title = text
    }

    func setImageToAdaptiveButton(image: UIImage) {
        self.image = image
    }

    func setSelectedImageToAdaptiveButton(image: UIImage?) {
        selectedImage = image
    }

    func setImageInsetsToAdaptiveButton(insets: UIEdgeInsets) {
        imageInsets = insets
    }

    func setTitleOffsetToAdaptiveButton(offset: UIOffset) {
        setTitlePositionAdjustment(offset)
    }

    func setTitleColorToAdaptiveButton(color: UIColor) {
        var dictionary = titleTextAttributesForState(UIControlState.Normal)
        dictionary.updateValue(color, forKey: NSForegroundColorAttributeName)
        setTitleTextAttributes(dictionary, forState: UIControlState.Normal)
    }
}
