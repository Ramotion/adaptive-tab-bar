//
//  AppearenceSettingManager.swift
//  AdaptiveController
//
//  Created by Arcilite on 13.11.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import Foundation

public class AppearenceSettingManager{
    private let defaultAppearencesStyles:Dictionary<StateKey,ControlStateValue>
    
    public init(stylesAppearances:Dictionary<StateKey,ControlStateValue>){
        defaultAppearencesStyles = stylesAppearances
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