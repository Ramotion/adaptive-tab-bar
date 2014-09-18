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
    optional func setImageToAdaptiveButton(image: UIImage)
    optional func setHighlightedToAdaptiveButton(image: UIImage)
    optional func setBackgroundImageToAdaptiveButton(image: UIImage)
    optional func setSelectedImageToAdaptiveButton(image: UIImage)
    optional func setImageInsetsToAdaptiveButton(insets: UIEdgeInsets)
    optional func setTitleOffsetToAdaptiveButton(offset: UIOffset)
}

let selected = "Selected"
let highlighted = "Higlihted"

class AdaptiveButtonsStateManager: NSObject {
    
    convenience init (state:AdaptiveState,buttonsAray:[AdaptiveButtonsProtocol],buttonsApperance:AdaptiveButtonApperance){
        self.init()
        self.setButtonsState(state, buttonsAray: buttonsAray, buttonsApperance: buttonsApperance)
    }
    
     func setButtonsState(state:AdaptiveState,buttonsAray:[AdaptiveButtonsProtocol],buttonsApperance:AdaptiveButtonApperance){
        
        var state:String = state.currentItemState
        
        
        for var index = 0; index < buttonsAray.count; ++index {
            println("index is \(index)")
            
            var button :AdaptiveButtonsProtocol = buttonsAray[index]
            
            button.setTitleToAdaptiveButton!(buttonsApperance.getButonTitleForState(state))
            button.setFontToAdaptiveButton!(buttonsApperance.getButonTitleFontForState(state))
            button.setImageToAdaptiveButton!(buttonsApperance.getButonImageForState(state))
            button.setHighlightedToAdaptiveButton!(buttonsApperance.getButonImageForState(state+highlighted))
            button.setSelectedImageToAdaptiveButton!(buttonsApperance.getButonImageForState(state+selected))
            button.setBackgroundImageToAdaptiveButton!(buttonsApperance.getBackgroundImageForState(state))
            button.setImageInsetsToAdaptiveButton!(buttonsApperance.getImageInsetsForState(state))
            button.setTitleOffsetToAdaptiveButton!(buttonsApperance.getTitleOffsetForState(state))
            

        }

    
    }
   
}
