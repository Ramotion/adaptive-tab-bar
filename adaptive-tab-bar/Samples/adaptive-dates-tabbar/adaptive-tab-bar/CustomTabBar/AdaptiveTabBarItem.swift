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
        setTitleTextAttributes([NSAttributedString.Key.font : font], for: UIControl.State.normal)
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
        let dictionary = convertFromOptionalNSAttributedStringKeyDictionary(titleTextAttributes(for: UIControl.State.normal))
        
        var attributes: [NSAttributedString.Key: Any] = [:]
        dictionary?.forEach { key, value in
            attributes[NSAttributedString.Key(key)] = value
        }
        
        attributes[NSAttributedString.Key.foregroundColor] = color
        setTitleTextAttributes(attributes, for: UIControl.State.normal)
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromOptionalNSAttributedStringKeyDictionary(_ input: [NSAttributedString.Key: Any]?) -> [String: Any]? {
	guard let input = input else { return nil }
	return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}
