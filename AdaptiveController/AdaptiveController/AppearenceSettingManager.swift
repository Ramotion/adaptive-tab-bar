//
//  AppearenceSettingManager.swift
//  AdaptiveController
//
//  Created by Arcilite on 13.11.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import Foundation
import UIKit

public class AppearenceSettingManager{
    private var defaultAppearencesStyles:Dictionary<StateKey,ControlStateValue>
    
    public init(){
        defaultAppearencesStyles = Dictionary<StateKey,ControlStateValue>()
    }
    
    public init(stylesAppearances:Dictionary<StateKey,ControlStateValue>){
        defaultAppearencesStyles = stylesAppearances
    }

    public func defaultStyleSettingsForNormalState(state:StateKey, titleOffset:UIOffset, imageInsets:UIEdgeInsets, titleColor:UIColor, font:UIFont, backgroundColor:UIColor ){
        var controlDefaultStyleStateAppearence = ControlStateAppearance()
        
        controlDefaultStyleStateAppearence.titleColor = titleColor
        controlDefaultStyleStateAppearence.imageInsets = imageInsets
        controlDefaultStyleStateAppearence.font = font
        controlDefaultStyleStateAppearence.backgroundColor = backgroundColor
        controlDefaultStyleStateAppearence.titleOffset = titleOffset
        let controlStatesValues = [UIControlState.Normal.rawValue:controlDefaultStyleStateAppearence]
        let controlStateValue =  ControlStateValue(values: controlStatesValues)
        
        defaultAppearencesStyles.updateValue(controlStateValue,forKey:state)
    }
    
    public func defaultStyleValuesForNormalState(state:StateKey, title:String, imageName:String) -> ControlStateValue {
        
        var defaultStateValue = defaultAppearencesStyles[state] as ControlStateValue?
        var normalDefaultAppearance = defaultStateValue?.controlStates[UIControlState.Normal.rawValue]
        var controlSmallTitleStyleStateAppearence = ControlStateAppearance(appearanceStyle:normalDefaultAppearance)
        
        controlSmallTitleStyleStateAppearence.imageName = imageName
        controlSmallTitleStyleStateAppearence.title = title
        
        let controSmallTitleStatesValues = [UIControlState.Normal.rawValue:controlSmallTitleStyleStateAppearence]
        let controlSmallTitleStateValue =  ControlStateValue(values: controSmallTitleStatesValues)
        return controlSmallTitleStateValue
    }

}