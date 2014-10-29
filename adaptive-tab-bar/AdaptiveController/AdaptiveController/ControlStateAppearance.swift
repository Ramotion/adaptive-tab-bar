//
//  ControlStateAppearance.swift
//  AdaptiveController
//
//  Created by Arcilite on 22.10.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit

public class ControlStateAppearance: AppearanceSerializationProtocol{
    public var title: String?
    public var font:  UIFont?
    public var imageName: String?
    public var backgroundImageName:String?
    public var titleOffset:UIOffset?
    public var imageInsets:UIEdgeInsets?
    public var titleColor:UIColor?
    public var backgroundColor:UIColor?
    public var enabled:Bool?
    
    public init(){
        title = "!!!!!!!!!!!!!!!"
        font = defaultFont
        titleOffset = defaultOffset
        imageInsets = defaultImageModeInsets
        titleColor = UIColor.blackColor()
        backgroundColor = UIColor.clearColor()
    }
    
    public convenience init(appearanceStyle:ControlStateAppearance?){
        self.init()
        font = appearanceStyle?.font
        titleOffset = appearanceStyle?.titleOffset
        imageInsets = appearanceStyle?.imageInsets
        titleColor = appearanceStyle?.titleColor
        backgroundColor = appearanceStyle?.backgroundColor
        imageName = appearanceStyle?.imageName
        backgroundImageName = appearanceStyle?.backgroundImageName
    }
    
    
    func getObjectDictionary() -> Dictionary<String,AnyObject>{
    
        return Dictionary()
    }
    
    func setObjectDictionary(dictionary:Dictionary<String,AnyObject>){
    
    }

}
