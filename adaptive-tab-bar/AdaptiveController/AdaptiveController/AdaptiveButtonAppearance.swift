//
//  AdaptiveButtonApperance.swift
//  AdaptiveTabBarControllerSample
//
//  Created by Arcilite on 18.09.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit

public let defaultFont: UIFont = UIFont(name: "Helvetica", size: 14.0)!
public let kNotTitle = ""

public class AdaptiveButtonAppearance: NSObject {

    private var butonsTitleForStateDictionary: Dictionary<String, String> = Dictionary<String, String>()
    private var butonsTitleFontForStateDictionary: Dictionary<String, UIFont> = Dictionary<String, UIFont>()
    private var buttonsImageForStateDictionary: Dictionary<String, UIImage> = Dictionary<String, UIImage>()
    private var buttonsBackgroundImageForStateDictionary: Dictionary<String, UIImage> = Dictionary<String, UIImage>()

    private var buttonsImageInsetsForStateDictionary: Dictionary<String, UIEdgeInsets> = Dictionary<String, UIEdgeInsets>()
    private var buttonsTitleInsetsForStateDictionary: Dictionary<String, UIOffset> = Dictionary<String, UIOffset>()
    private var buttonsTitleColorsForStateDictionary: Dictionary<String, UIColor> = Dictionary<String, UIColor>()

    func setInsetsFromAdaptiveButtonApperance(_ apperance: AdaptiveButtonAppearance) {
        buttonsImageInsetsForStateDictionary = apperance.buttonsImageInsetsForStateDictionary
        buttonsTitleInsetsForStateDictionary = apperance.buttonsTitleInsetsForStateDictionary
    }

    public func setFontsFromAdaptiveButtonApperance(_ apperance: AdaptiveButtonAppearance) {
        butonsTitleFontForStateDictionary = apperance.butonsTitleFontForStateDictionary
    }

    public func setAllCommonApperanceFrom(adaptiveButtonApperance: AdaptiveButtonAppearance) {
        setInsetsFromAdaptiveButtonApperance(adaptiveButtonApperance)
        setFontsFromAdaptiveButtonApperance(adaptiveButtonApperance)
        buttonsTitleColorsForStateDictionary = adaptiveButtonApperance.buttonsTitleColorsForStateDictionary
    }

    public func setImageNamesForStatesImageExtesions(imageName: String, imageExtensionsForState: Dictionary<String, String>) {
        setButtonImage(image: UIImage(named: imageName), state: kDefaultAdaptiveState)
        for (state, imageExtension) in imageExtensionsForState {
            setButtonImage(image: UIImage(named: imageName + imageExtension), state: state)
        }
    }

    public func setButonTitle(title: String, state: String) {
        butonsTitleForStateDictionary.updateValue(title, forKey: state)
    }

    public func getButonTitleForState(state: String) -> String! {

        if let title = butonsTitleForStateDictionary[state] {
            return title
        } else {
            if let title = butonsTitleForStateDictionary[kDefaultAdaptiveState] {
                return title
            } else {
                return kNotTitle
            }
        }
    }

    public func setButonTitleFontForState(font: UIFont, state: String) {
        butonsTitleFontForStateDictionary.updateValue(font, forKey: state)
    }

    public func getButonTitleFontForState(state: String) -> UIFont {
        
        if let font = butonsTitleFontForStateDictionary[state] {
            return font
        } else {
            if let font = butonsTitleFontForStateDictionary[kDefaultAdaptiveState] {
                return font
            } else {
                return defaultFont
            }
        }
    }

    public func setButtonImage(image: UIImage?, state: String) {
        buttonsImageForStateDictionary[state] = image
    }

    public func getButonImageForState(state: String) -> UIImage? {

        if let image = buttonsImageForStateDictionary[state] {
            return image
        } else {
            return buttonsImageForStateDictionary[kDefaultAdaptiveState]
        }
    }

    public func setBackgroundButonImage(image: UIImage, state: String) {
        buttonsImageForStateDictionary.updateValue(image, forKey: state)
    }

    public func getBackgroundImageForState(state: String) -> UIImage? {

        if let image = buttonsBackgroundImageForStateDictionary[state] {
            return image
        } else {
            return buttonsBackgroundImageForStateDictionary[kDefaultAdaptiveState]
        }
    }

    public func setImageInsets(insets: UIEdgeInsets, state: String) {
        buttonsImageInsetsForStateDictionary.updateValue(insets, forKey: state)
    }

    public func getImageInsetsForState(state: String) -> UIEdgeInsets {

        if let insets = buttonsImageInsetsForStateDictionary[state] {
            return insets
        } else {
            return buttonsImageInsetsForStateDictionary[kDefaultAdaptiveState] ?? UIEdgeInsets.zero
        }
    }

    public func setTitleOffset(insets: UIOffset, state: String) {
        buttonsTitleInsetsForStateDictionary.updateValue(insets, forKey: state)
    }

    public func getTitleOffsetForState(state: String) -> UIOffset {

        if let offset: UIOffset = buttonsTitleInsetsForStateDictionary[state] {
            return offset
        } else {
            return buttonsTitleInsetsForStateDictionary[kDefaultAdaptiveState] ?? UIOffset.zero
        }
    }

    public func setTitleColor(color: UIColor, state: String) {
        buttonsTitleColorsForStateDictionary.updateValue(color, forKey: state)
    }

    public func getTitleColorForState(state: String) -> UIColor? {

        if let color: UIColor = buttonsTitleColorsForStateDictionary[state] {
            return color
        } else {
            return buttonsTitleColorsForStateDictionary[kDefaultAdaptiveState]
        }
    }
}
