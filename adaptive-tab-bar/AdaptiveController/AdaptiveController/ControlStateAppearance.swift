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

let leftKey = "leftKey"
let topKey =  "topKey"
let rightKey = "rightKey"
let bottomKey = "bottomKey"

let fontNameKey = "fontNameKey"
let fontSizeKey = "fontSizeKey"

let redColor = "redColor"
let greenColor = "greenColor"
let blueColor = "blueColor"
let alphaColor = "alphaColor"

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
        offsetDictionary[xKey] = titleOffset?.horizontal
        offsetDictionary[yKey] = titleOffset?.vertical
        controlStateDictionary[titleOffsetKey] = offsetDictionary
        
        
        var insetsDictionary =  Dictionary<String,AnyObject>()
        
        insetsDictionary[bottomKey] = imageInsets?.bottom
        insetsDictionary[topKey] = imageInsets?.top
        insetsDictionary[leftKey] = imageInsets?.left
        insetsDictionary[rightKey] = imageInsets?.right
        
        insetsDictionary[titleOffsetKey] = insetsDictionary
        
        insetsDictionary[colorKey] = colorToDctionary(titleColor!)
        insetsDictionary[backgroundColorKey] = colorToDctionary(backgroundColor!)

        
        return controlStateDictionary
    }
    
    func colorToDctionary(color:UIColor) -> Dictionary<String,AnyObject>{
        
        var  colorDictionary =  Dictionary<String,AnyObject>()
        var  components = CGColorGetComponents(color.CGColor)
        
        colorDictionary[redColor] = components[0]
        colorDictionary[blueColor] = components[1]
        colorDictionary[greenColor] = components[2]
        colorDictionary[alphaColor] = components[4]
        
        return colorDictionary
    }
    
    func setObjectDictionary(dictionary:Dictionary<String,AnyObject>){
        title = dictionary[titleKey] as? String
        var fontDictionary :Dictionary <String, AnyObject> = dictionary[fontKey] as Dictionary <String, AnyObject>
        var fontName:String  = fontDictionary [fontNameKey]! as String
        var fontSize:CGFloat = fontDictionary [fontSizeKey]! as CGFloat
        font =  UIFont( name: fontName, size:fontSize )
    
    }

}
