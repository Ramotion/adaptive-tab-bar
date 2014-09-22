//
//  AdaptiveButtonsStateManager.swift
//  AdaptiveTabBarControllerSample
//
//  Created by Arcilite on 18.09.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit

@objc protocol AdaptiveButtonsProtocol {
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
    
    convenience init (state:AdaptiveState,buttonsAray:[AdaptiveButtonsProtocol],buttonsApperance:[AdaptiveButtonApperance]){
        self.init()
        self.setButtonsState(state, buttonsAray: buttonsAray, buttonsApperance: buttonsApperance)
    }
    
     func setButtonsState(state:AdaptiveState,buttonsAray:[AdaptiveButtonsProtocol],buttonsApperance:[AdaptiveButtonApperance]){
        
        var state:String = state.currentItemState!
        
        var countElements = buttonsAray.count > buttonsApperance.count ? buttonsApperance.count : buttonsAray.count
        for var index = 0; index < countElements; ++index {
            println("index is \(index)")
            println("buttons count array is \(buttonsAray.count)")
            
            var button :AdaptiveButtonsProtocol = buttonsAray[index]
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
