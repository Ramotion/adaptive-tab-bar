//
//  AdaptiveButtonsStateManager.swift
//  AdaptiveTabBarControllerSample
//
//  Created by Arcilite on 18.09.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit


 @objc public protocol AdaptiveApperanceProtocol {
    optional func setFontToAdaptiveButton(font: UIFont)
    optional func setTitleToAdaptiveButton(text: NSString)
    optional func setImageToAdaptiveButton(image: UIImage?)
    optional func setHighlightedToAdaptiveButton(image: UIImage?)
    optional func setBackgroundImageToAdaptiveButton(image: UIImage?)
    optional func setSelectedImageToAdaptiveButton(image: UIImage?)
    optional func setImageInsetsToAdaptiveButton(insets: UIEdgeInsets)
    optional func setTitleOffsetToAdaptiveButton(offset: UIOffset)
    optional func setTitleColorToAdaptiveButton(titleColor: UIColor)
}


public class AdaptiveButtonsStateManager <AdaptiveStateClass: AdaptiveState> {

    
     public class func  setupButtonsAppearanceFromState(adaptiveState:AdaptiveStateClass,buttonsAray:[AdaptiveApperanceProtocol],buttonsAppearances:[AdaptiveButtonAppearance]){
        
        var state = adaptiveState.currentItemState
        
        var countElements = buttonsAray.count > buttonsAppearances.count ? buttonsAppearances.count : buttonsAray.count
        for var index = 0; index < countElements; ++index {
          
            var button :AdaptiveApperanceProtocol = buttonsAray[index]
            var buttonApperance = buttonsAppearances[index]
            
              let statesValues = buttonApperance.stateDictionary[state!]
//            let title = buttonApperance.getButonTitleForState(state)
//           
//            button.setTitleToAdaptiveButton!(title)
//
//            
//            button.setFontToAdaptiveButton!(buttonApperance.getButonTitleFontForState(state))
//            
//            if let image = buttonApperance.getButonImageForState(state) {
//                button.setImageToAdaptiveButton?(image)
//            }
//            
//            if let backgroundImage = buttonApperance.getButonImageForState(state) {
//                button.setBackgroundImageToAdaptiveButton?(backgroundImage)
//            }
//            
//            if let imageInset = buttonApperance.getImageInsetsForState(state) {
//                button.setImageInsetsToAdaptiveButton?(imageInset)
//            }
//            
//            if let titleOffset = buttonApperance.getTitleOffsetForState(state) {
//                button.setTitleOffsetToAdaptiveButton?(titleOffset)
//            }
//            
//            if let titleColor = buttonApperance.getTitleColorForState(state) {
//                button.setTitleColorToAdaptiveButton?(titleColor)
//            }
//            
//            
//            if let selectedImage = buttonApperance.getButonImageForState(state,controlState:UIControlState.Selected){
//                button.setSelectedImageToAdaptiveButton?(selectedImage)
//            }else{
//                if let selectedImage = buttonApperance.getButonImageForState(state,controlState:UIControlState.Normal){
//                    button.setSelectedImageToAdaptiveButton?(selectedImage)
//                }
//            }
//            
//            if let highlightedImage = buttonApperance.getButonImageForState(state,controlState:UIControlState.Highlighted) {
//                button.setHighlightedToAdaptiveButton?(highlightedImage)
//            }

        }

    
    }
   
}
