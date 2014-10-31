//
//  ControlStateAppearance.swift
//  AdaptiveController
//
//  Created by Arcilite on 22.10.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit

let titleKey = "title"
let fontKey = "fontKey"
let imageNameKey = "imageNameKey"
let backgroundImageNameKey = "backgroundImageNameKey"
let titleOffsetKey = "titleOffsetKey"
let imageInsetsKey = "imageInsetsKey"
let colorKey = "colorKey"
let backgroundColorKey = "backgroundColorKey"

let xKey = "xKey"
let yKey = "yKey"
let heightKey = "heightKey"
let widthKey = "widthKey"
let fontNameKey = "fontNameKey"
let fontSizeKey = "fontSizeKey"


public class ControlStateAppearance: AppearanceSerializationProtocol{
    public var title: String?
    public var font:  UIFont?
    public var imageName: String?
    public var image: UIImage?
    public var backgroundImageName:String?
    public var backgroundImage: UIImage?
    public var titleOffset:UIOffset?
    public var imageInsets:UIEdgeInsets?
    public var titleColor:UIColor?
    public var backgroundColor:UIColor?
    public var enabled:Bool?
    
    public init(){
        title = ""
        font = defaultFont
        titleOffset = defaultOffset
        imageInsets = defaultImageModeInsets
        titleColor = UIColor.blackColor()
        backgroundColor = UIColor.clearColor()
    }
    public convenience init(appearanceFullStyle:ControlStateAppearance?){
        self.init()
        font = appearanceFullStyle?.font
        titleOffset = appearanceFullStyle?.titleOffset
        imageInsets = appearanceFullStyle?.imageInsets
        titleColor = appearanceFullStyle?.titleColor
        backgroundColor = appearanceFullStyle?.backgroundColor
        imageName = appearanceFullStyle?.imageName
        backgroundImageName = appearanceFullStyle?.backgroundImageName
        image = appearanceFullStyle?.image
        backgroundImage = appearanceFullStyle?.backgroundImage
    }
    
    public convenience init(appearanceStyle:ControlStateAppearance?){
        self.init()
        font = appearanceStyle?.font
        titleOffset = appearanceStyle?.titleOffset
        imageInsets = appearanceStyle?.imageInsets
        titleColor = appearanceStyle?.titleColor
        backgroundColor = appearanceStyle?.backgroundColor
       // imageName = appearanceStyle?.imageName
       // backgroundImageName = appearanceStyle?.backgroundImageName
        //image = appearanceStyle?.image
       // backgroundImage = appearanceStyle?.backgroundImage
    }
    
    
    func getObjectDictionary() -> Dictionary<String,AnyObject>{
        var controlStateDictionary =  Dictionary<String,AnyObject>()
        controlStateDictionary[titleKey] = title!
        
        var fontDictionary =  Dictionary<String,AnyObject>()
        fontDictionary[fontNameKey] = font?.fontName
        fontDictionary[fontSizeKey] = font?.pointSize
        controlStateDictionary[fontKey] = fontDictionary
        
        var offsetDictionary =  Dictionary<String,AnyObject>()
        fontDictionary[xKey] = titleOffset?.horizontal
        fontDictionary[yKey] = titleOffset?.vertical
        controlStateDictionary[titleOffsetKey] = offsetDictionary
        
//        public var imageName: String?
//        public var image: UIImage?
//        public var backgroundImageName:String?
//        public var backgroundImage: UIImage?
//        public var titleOffset:UIOffset?
//        public var imageInsets:UIEdgeInsets?
//        public var titleColor:UIColor?
//        public var backgroundColor:UIColor?
//        public var enabled:Bool?
        
        return controlStateDictionary
    }
    
    func setObjectDictionary(dictionary:Dictionary<String,AnyObject>){
    
    }

}
