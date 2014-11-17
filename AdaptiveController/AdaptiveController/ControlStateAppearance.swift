//
//  ControlStateAppearance.swift
//  AdaptiveController
//
//  Created by Arcilite on 22.10.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit

let titleKey = "title"
let fontKey = "font"
let imageNameKey = "imageName"
let backgroundImageNameKey = "backgroundImageName"
let titleOffsetKey = "titleOffset"
let imageInsetsKey = "imageInsets"
let colorKey = "color"
let backgroundColorKey = "backgroundColor"

let horizontalKey = "horizontal"
let verticalKey = "vertical"
let heightKey = "height"
let widthKey = "width"

let leftKey = "left"
let topKey =  "top"
let rightKey = "right"
let bottomKey = "bottom"

let fontNameKey = "fontName"
let fontSizeKey = "fontSize"

let redColor = "red"
let greenColor = "green"
let blueColor = "blue"
let alphaColor = "alpha"

public class ControlStateAppearance: AppearanceSerializationProtocol{
 
    typealias DictionaryObject = AnyObject
    typealias StateObject = AnyObject
    
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
        //font = defaultFont
       // titleOffset = defaultOffset
        //imageInsets = defaultImageModeInsets
        titleColor = UIColor.whiteColor()
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
        title = appearanceStyle?.title
    }
    
    
   
    
    func colorToDctionary(color:UIColor) -> Dictionary<String,AnyObject>{
        
        var  components = CGColorGetComponents(color.CGColor)
        
        var  colorDictionary =  Dictionary<String,AnyObject>()
       
        if CGColorGetNumberOfComponents(color.CGColor) == 2{
            colorDictionary[redColor] = components[0]
            colorDictionary[greenColor] = components[0]
            colorDictionary[blueColor] = components[0]
            colorDictionary[alphaColor] = components[1]
        }else{
            colorDictionary[redColor] = components[0]
            colorDictionary[greenColor] = components[1]
            colorDictionary[blueColor] = components[2]
            colorDictionary[alphaColor] = components[3]
        }

        return colorDictionary
    }
    
    func dictionaryToColor(colorDictionary: Dictionary<String,CGFloat>?) -> UIColor{
        if let colorValueDictioanary = colorDictionary {
            var red:CGFloat  = 0

            if let redValue = colorValueDictioanary [redColor]{
                red = redValue
            }
            
            var green:CGFloat = 0
            
            if let  greenValue =  colorValueDictioanary [greenColor]{
                green = greenValue
            }
          
            var blue:CGFloat  = 0
            
            if let blueValue = colorValueDictioanary [blueColor]{
                 blue = blueValue
            }
            
            var alpha:CGFloat  =  0
            
            if let alphaValue = colorValueDictioanary [alphaColor]{
              alpha = alphaValue
            }
            
            return  UIColor(red: red, green: green, blue: blue, alpha: alpha)
        }else{
            return UIColor.clearColor()
        }
    }
    
    func dictionaryToInsets(insetsDictionary: Dictionary<String,CGFloat>?) -> UIEdgeInsets!{
        if let insetsDictionary = insetsDictionary{
            var left:CGFloat = 0
            if let leftDictioanaryValue = insetsDictionary [leftKey]{
                left = leftDictioanaryValue
            }
            
            var top:CGFloat = 0
            
            if let topDictioanaryValue =  insetsDictionary [topKey]{
                top = topDictioanaryValue
            }
            
            var right:CGFloat  = 0
            
            if let rightDictionary = insetsDictionary[rightKey]{
                right = rightDictionary
            }
            
            var bottom:CGFloat = 0
            
            if let bottomDictionaryValue =  insetsDictionary[bottomKey]{
                bottom = bottomDictionaryValue
            }
            
            return UIEdgeInsetsMake(top, left, bottom, right)
        }else{
            return UIEdgeInsetsZero
        }
        
    }
    
    func dictionaryToOffset(offsetDictionary: Dictionary<String,CGFloat>?) -> UIOffset{
        
        var horizontal:CGFloat  = 0
        
        if let horizontalFromDictionary = offsetDictionary![horizontalKey]{
            horizontal = horizontalFromDictionary
        }
        
        var vertical:CGFloat = 0
        
        if let verticalFromDictionary = offsetDictionary![verticalKey]{
            vertical = verticalFromDictionary
        }
        
        return UIOffsetMake(horizontal, vertical)
        
    }
    
    
    func dictionaryToFont(fontDictionary: Dictionary<String,AnyObject>) -> UIFont{
        
        var fontName:String  = fontDictionary [fontNameKey]! as String
        var fontSize:CGFloat = fontDictionary [fontSizeKey]! as CGFloat
        
        return  UIFont( name: fontName, size:fontSize )!
    }
    
    func setObjectDictionary(dictionary:Dictionary<String,DictionaryObject>){
       
        title = dictionary[titleKey] as? String
        font =  dictionaryToFont(dictionary[fontKey] as Dictionary <String, AnyObject>)
        titleOffset = dictionaryToOffset(dictionary[titleOffsetKey] as? Dictionary <String, CGFloat>)
        imageInsets = dictionaryToInsets(dictionary[imageInsetsKey] as? Dictionary <String, CGFloat>)
        titleColor =  dictionaryToColor(dictionary[colorKey]! as? Dictionary <String, CGFloat>)
        backgroundColor =  dictionaryToColor(dictionary[backgroundColorKey]! as? Dictionary <String, CGFloat>)
        
        if let imageName = dictionary[imageNameKey] as? String{
            image = UIImage(named:imageName)
            self.imageName = imageName
        }
        
        if let backgroundImageName = dictionary[backgroundImageNameKey] as? String{
            backgroundImage = UIImage(named:backgroundImageName)
        }
        
    }
    
    func getObjectDictionary() -> Dictionary<String,DictionaryObject>{
        var controlStateDictionary =  Dictionary<String,AnyObject>()
        
        if  title != nil {
          controlStateDictionary[titleKey] = title!
        }else{
             controlStateDictionary[titleKey] = ""
        }
        
        var fontDictionary =  Dictionary<String,AnyObject>()
        fontDictionary[fontNameKey] = font?.fontName
        fontDictionary[fontSizeKey] = font?.pointSize
        controlStateDictionary[fontKey] = fontDictionary
        
        var offsetDictionary =  Dictionary<String,AnyObject>()
        offsetDictionary[horizontalKey] = titleOffset?.horizontal
        offsetDictionary[verticalKey] = titleOffset?.vertical
        controlStateDictionary[titleOffsetKey] = offsetDictionary
        
        
        var insetsDictionary =  Dictionary<String,AnyObject>()
        
        insetsDictionary[bottomKey] = imageInsets?.bottom
        insetsDictionary[topKey] = imageInsets?.top
        insetsDictionary[leftKey] = imageInsets?.left
        insetsDictionary[rightKey] = imageInsets?.right
        
        controlStateDictionary[imageInsetsKey] = insetsDictionary
        if titleColor != nil{
          controlStateDictionary[colorKey] = colorToDctionary(titleColor!)
        }else{
             controlStateDictionary[colorKey] = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        }
        
       
        controlStateDictionary[backgroundColorKey] = colorToDctionary(backgroundColor!)
        controlStateDictionary[imageNameKey] = imageName
        controlStateDictionary[backgroundImageNameKey] = backgroundImageName
        
        return controlStateDictionary
    }

}
