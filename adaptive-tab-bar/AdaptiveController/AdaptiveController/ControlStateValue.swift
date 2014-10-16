//
//  ControlState.swift
//  AdaptiveController
//
//  Created by Arcilite on 16.10.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit

public enum ControlStateEnum {
    case ControlStateFont(UIFont), ControlStateImage(UIImage),ControlStateTitle(String),ControlStateInsets(UIEdgeInsets),ControlStateColor(UIColor),UIControlStateOffset(UIOffset)
}



public class ControlStateValue:ControlStateProtocol{
   
    public typealias StateEnum = ControlStateEnum
    
    public var normalState: ControlStateEnum?
    public var selectedState: ControlStateEnum?
    public var highlightedState: ControlStateEnum?


    public init(image: UIImage) {
        normalState = .ControlStateImage(image)
        selectedState = .ControlStateImage(image)
        highlightedState = .ControlStateImage(image)

    }
    
    public init(color: UIColor) {
        normalState = .ControlStateColor(color)
        selectedState = .ControlStateColor(color)
        highlightedState = .ControlStateColor(color)
        
    }
    
    public init(title: String) {
        normalState = .ControlStateTitle(title)
        selectedState = .ControlStateTitle(title)
        highlightedState = .ControlStateTitle(title)
    }
    
    public init(insets: UIEdgeInsets) {
        normalState = .ControlStateInsets(insets)
        selectedState = .ControlStateInsets(insets)
        highlightedState = .ControlStateInsets(insets)
    }
    
    
    public init(offset: UIOffset) {
        normalState = .UIControlStateOffset(offset)
        selectedState = .UIControlStateOffset(offset)
        highlightedState = .UIControlStateOffset(offset)
    }
    
    public init(font: UIFont) {
        normalState = .ControlStateFont(font)
        selectedState = .ControlStateFont(font)
        highlightedState = .ControlStateFont(font)
    }
    
    
    public func setNormalStateColor(color:UIColor){
        normalState = .ControlStateColor(color)
    }
    
    public func setSelectedStateColor(color:UIColor){
        selectedState = .ControlStateColor(color)
    }
    
    public func setHighlightedStateColor(color:UIColor){
        highlightedState = .ControlStateColor(color)
    }
    
    public func setNormalStateImage(image:UIImage){
        normalState = .ControlStateImage(image)
    }
    
    public func seSelectedStateImage(image:UIImage){
        selectedState = .ControlStateImage(image)
    }
    
    public func setHighlightedStateImage(image:UIImage){
        highlightedState = .ControlStateImage(image)
    }
    
}
