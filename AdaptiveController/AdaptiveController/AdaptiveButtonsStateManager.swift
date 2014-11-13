//
//  AdaptiveButtonsStateManager.swift
//  AdaptiveTabBarControllerSample
//
//  Created by Arcilite on 18.09.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit


 @objc public protocol AdaptiveApperanceProtocol {
    func setFontToAdaptiveButton(font: UIFont , controlState:UIControlState)
    //optional func setFontToAdaptiveButton(font: UIFont)
    optional func setTitleToAdaptiveButton(text: NSString)
    optional func setImageToAdaptiveButton(image: UIImage?)
    optional func setHighlightedToAdaptiveButton(image: UIImage?)
    optional func setBackgroundImageToAdaptiveButton(image: UIImage?)
    optional func setSelectedImageToAdaptiveButton(image: UIImage?)
    optional func setImageInsetsToAdaptiveButton(insets: UIEdgeInsets)
    optional func setTitleOffsetToAdaptiveButton(offset: UIOffset)
    //optional func setTitleColorToAdaptiveButton(titleColor: UIColor)
    
     optional func setTitleColorToAdaptiveButton(color: UIColor, controlState:UIControlState)
}


public class AdaptiveButtonsStateManager <AdaptiveStateClass: AdaptiveState> {

    
     public class func  setupButtonsAppearanceFromState(adaptiveState:AdaptiveStateClass,buttonsAray:[AdaptiveApperanceProtocol],buttonsAppearances:[AdaptiveButtonAppearance]){
        
        var state = adaptiveState.currentItemState
        
        var countElements = buttonsAray.count > buttonsAppearances.count ? buttonsAppearances.count : buttonsAray.count
        for var index = 0; index < countElements; ++index {
          
            var button :AdaptiveApperanceProtocol = buttonsAray[index]
            var buttonApperance = buttonsAppearances[index]
            
            let controlStateValue = buttonApperance.stateDictionary[state!]! as ControlStateValue
            let normalStateAppearenceObject = controlStateValue.controlStates[UIControlState.Normal.rawValue]
            
            
           
            
            if let title = normalStateAppearenceObject?.title {
                button.setTitleToAdaptiveButton?(title)
            }
            let imageName = normalStateAppearenceObject?.imageName!
          
            if let image = UIImage(named: imageName!) {
                button.setImageToAdaptiveButton?(image)
            }
            
            
            if let backgroundImage = normalStateAppearenceObject?.backgroundImage {
                button.setBackgroundImageToAdaptiveButton?(backgroundImage)
            }
            
            if let imageInset = normalStateAppearenceObject?.imageInsets{
                button.setImageInsetsToAdaptiveButton?(imageInset)
            }
            
            if let titleOffset = normalStateAppearenceObject?.titleOffset {
                button.setTitleOffsetToAdaptiveButton?(titleOffset)
            }
            
            for (key, controlStateValue) in controlStateValue.controlStates{
               
                if let titleFont = controlStateValue.font{
                    println(UIControlState(key).getStringKey())
                    button.setFontToAdaptiveButton(titleFont , controlState:UIControlState(key))
                }
                
                if let titleColor = controlStateValue.titleColor{
                    button.setTitleColorToAdaptiveButton?(titleColor, controlState:UIControlState(key) )
                }
                
            }
//            if let titleColor = normalStateAppearenceObject?.titleColor {
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
