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
    
    func setFontToAdaptiveButton(font: UIFont) {
        setTitleTextAttributes([NSAttributedStringKey.font : font], for: UIControlState.normal)
    }

    func setTitleToAdaptiveButton(text: String) {
        title = text
    }

    func setImageToAdaptiveButton(image: UIImage?) {
        self.image = image
    }

    func setSelectedImageToAdaptiveButton(image: UIImage?) {
        selectedImage = image
    }

    func setImageInsetsToAdaptiveButton(insets: UIEdgeInsets) {
        imageInsets = insets
    }

    func setTitleOffsetToAdaptiveButton(offset: UIOffset) {
        titlePositionAdjustment = offset
    }

    func setTitleColorToAdaptiveButton(color: UIColor) {
        let dictionary = titleTextAttributes(for: UIControlState.normal)
        
        var attributes: [NSAttributedStringKey: Any] = [:]
        dictionary?.forEach { key, value in
            attributes[NSAttributedStringKey(key)] = value
        }
        
        attributes[NSAttributedStringKey.foregroundColor] = color
        setTitleTextAttributes(attributes, for: UIControlState.normal)
    }
}
