//
//  AdaptiveButtonsStateManager.swift
//  AdaptiveTabBarControllerSample
//
//  Created by Arcilite on 18.09.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit

let countDaysToSmallTextState = 14
let countDaysToImageState = 30

let defaultInsets = UIEdgeInsetsMake(0, 0,0, 0)
let defaultSmallTitleModeFont = UIFont(name: "Helvetica", size: 10.0)
let defaultSmallTitleModeImageInsets = UIEdgeInsetsMake(0,  0,  0,  0)
let defaultImageModeInsets = UIEdgeInsetsMake(6,  0,  -6,  0)
let defaultSmallTitleModeOffset = UIOffsetMake(0, 20)
let defaultOffset = UIOffsetMake(0, 00)
let tabColor = UIColor(red: 169/255, green: 79/255, blue: 152/255, alpha: 1.0)



@objc protocol AdaptiveApperanceProtocol {
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

let selected = "Selected"
let highlighted = "Higlihted"

class AdaptiveButtonsStateManager: NSObject {
    
    convenience init (state:AdaptiveState,buttonsAray:[AdaptiveApperanceProtocol],buttonsApperance:[AdaptiveButtonApperance]){
        self.init()
        self.setButtonsState(state, buttonsAray: buttonsAray, buttonsApperance: buttonsApperance)
    }
    
     func setButtonsState(state:AdaptiveState,buttonsAray:[AdaptiveApperanceProtocol],buttonsApperance:[AdaptiveButtonApperance]){
        
        var state:String = state.currentItemState!
        
        var countElements = buttonsAray.count > buttonsApperance.count ? buttonsApperance.count : buttonsAray.count
        for var index = 0; index < countElements; ++index {
            println("index is \(index)")
            println("buttons count array is \(buttonsAray.count)")
            
            var button :AdaptiveApperanceProtocol = buttonsAray[index]
            var buttonApperance = buttonsApperance[index]
            button.setTitleToAdaptiveButton!(buttonApperance.getButonTitleForState(state))
            button.setFontToAdaptiveButton!(buttonApperance.getButonTitleFontForState(state))
            
            if let image = buttonApperance.getButonImageForState(state) {
                button.setImageToAdaptiveButton?(image)
            }
            
            if let selectedImage = buttonApperance.getButonImageForState(state+selected) {
                button.setSelectedImageToAdaptiveButton?(selectedImage)
            }
          
            if let highlightedImage = buttonApperance.getButonImageForState(state+highlighted) {
                 button.setHighlightedToAdaptiveButton?(highlightedImage)
            }
            
            if let backgroundImage = buttonApperance.getButonImageForState(state) {
                button.setBackgroundImageToAdaptiveButton?(backgroundImage)
            }
            
            if let imageInset = buttonApperance.getImageInsetsForState(state) {
                button.setImageInsetsToAdaptiveButton?(imageInset)
            }
            
            if let titleOffset = buttonApperance.getTitleOffsetForState(state) {
                button.setTitleOffsetToAdaptiveButton?(titleOffset)
            }
            
            if let titleColor = buttonApperance.getTitleColorForState(state) {
                button.setTitleColorToAdaptiveButton?(titleColor)
            }
            

        }

    
    }
   
}
