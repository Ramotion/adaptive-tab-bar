//
//  AdaptiveButtonsStateManager.swift
//  AdaptiveTabBarControllerSample
//
//  Created by Arcilite on 18.09.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit

public let countDaysToSmallTextState = 14
public let countDaysToImageState = 30

public let defaultInsets = UIEdgeInsetsMake(0, 0, 0, 0)
public let defaultSmallTitleModeFont = UIFont(name: "Helvetica", size: 10.0)
public let defaultSmallTitleModeImageInsets = UIEdgeInsetsMake(0, 0, 0, 0)
public let defaultImageModeInsets = UIEdgeInsetsMake(6, 0, -6, 0)
public let defaultSmallTitleModeOffset = UIOffsetMake(0, 20)
public let defaultOffset = UIOffsetMake(0, 00)
public let tabColor = UIColor(red: 169 / 255, green: 79 / 255, blue: 152 / 255, alpha: 1.0)

@objc public protocol AdaptiveApperanceProtocol {
    @objc optional func setFontToAdaptiveButton(font: UIFont)
    @objc optional func setTitleToAdaptiveButton(text: String)
    @objc optional func setImageToAdaptiveButton(image: UIImage?)
    @objc optional func setHighlightedToAdaptiveButton(image: UIImage?)
    @objc optional func setBackgroundImageToAdaptiveButton(image: UIImage?)
    @objc optional func setSelectedImageToAdaptiveButton(image: UIImage?)
    @objc optional func setImageInsetsToAdaptiveButton(insets: UIEdgeInsets)
    @objc optional func setTitleOffsetToAdaptiveButton(offset: UIOffset)
    @objc optional func setTitleColorToAdaptiveButton(titleColor: UIColor)
}

public let selected = "Selected"
public let highlighted = "Higlihted"

public class AdaptiveButtonsStateManager: NSObject {

    public convenience init(state: AdaptiveState, buttonsAray: [AdaptiveApperanceProtocol], buttonsAppearance: [AdaptiveButtonAppearance]) {
        self.init()
        setButtonsState(state: state, buttonsAray: buttonsAray, buttonsAppearance: buttonsAppearance)
    }

    public func setButtonsState(state: AdaptiveState, buttonsAray: [AdaptiveApperanceProtocol], buttonsAppearance: [AdaptiveButtonAppearance]) {

        var state: String = state.currentItemState

        var countElements = buttonsAray.count > buttonsAppearance.count ? buttonsAppearance.count : buttonsAray.count
        for var index = 0; index < countElements; ++index {

            var button: AdaptiveApperanceProtocol = buttonsAray[index]
            var buttonApperance = buttonsAppearance[index]

            let title = buttonApperance.getButonTitleForState(state)
            button.setTitleToAdaptiveButton!(title)

            button.setFontToAdaptiveButton!(buttonApperance.getButonTitleFontForState(state))

            if let image = buttonApperance.getButonImageForState(state) {
                button.setImageToAdaptiveButton?(image)
            } else {
            }

            if let selectedImage = buttonApperance.getButonImageForState(state: state + selected) {
                button.setSelectedImageToAdaptiveButton?(selectedImage)
            }

            if let highlightedImage = buttonApperance.getButonImageForState(state: state + highlighted) {
                button.setHighlightedToAdaptiveButton?(image: highlightedImage)
            }

            if let backgroundImage = buttonApperance.getButonImageForState(state: state) {
                button.setBackgroundImageToAdaptiveButton?(image: backgroundImage)
            }

            if let imageInset = buttonApperance.getImageInsetsForState(state: state) {
                button.setImageInsetsToAdaptiveButton?(imageInset)
            }

            if let titleOffset = buttonApperance.getTitleOffsetForState(state: state) {
                button.setTitleOffsetToAdaptiveButton?(titleOffset)
            }

            if let titleColor = buttonApperance.getTitleColorForState(state: state) {
                button.setTitleColorToAdaptiveButton?(titleColor)
            }
        }
    }
}
