//
//  DictioanarySeriliazator.swift
//  AdaptiveController
//
//  Created by Arcilite on 04.11.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit

public class DictioanarySeriliazator: NSObject {
    let rootKey:NSString = "Root"
    public typealias DictionaryObject = Dictionary <String,AnyObject>
    
   
    public func buttonApperancesToArrayDictionary(buttonApearances:[AdaptiveButtonAppearance]) -> Array<Dictionary<String, AnyObject>>{
        var buttonsAperancesDictionaryArray  =  Array<Dictionary<String, AnyObject>>()
        for appeareance in buttonApearances{
             buttonsAperancesDictionaryArray.append(appeareance.getObjectDictionary())
        }
        return buttonsAperancesDictionaryArray
    }
    
    public func saveStateDictionary(buttonApearances:[AdaptiveButtonAppearance],filePath:String){
        
        var paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        var path = paths.stringByAppendingPathComponent("appearances.plist")
        println(path)
        println(filePath)
        var dataArray =  buttonApperancesToArrayDictionary(buttonApearances)
        var data : NSArray = dataArray as NSArray
        var fileManager = NSFileManager.defaultManager()
        if (!(fileManager.fileExistsAtPath(paths)))
        {
            println("error")
        }
        
        data.writeToFile(filePath, atomically: true)
        
    }
    
    public func dictionaryApperancesToArrayApperances(buttonApearancesDictionary:Array<Dictionary<String, DictionaryObject>>) -> [AdaptiveButtonAppearance]{
        var buttonsAperancesDictionaryArray  = [AdaptiveButtonAppearance]()
        for appeareanceDictionary in buttonApearancesDictionary{
            var appearance = AdaptiveButtonAppearance()
            appearance.setObjectDictionary(appeareanceDictionary)
            buttonsAperancesDictionaryArray.append(appearance)
        }
        return buttonsAperancesDictionaryArray
    }
    
    
    public func getButtonApperances(filePath:String)->[AdaptiveButtonAppearance] {
        
        if countElements(filePath) > 0 {
            // The file saved previously
            
            // Check for existence of the file
            if NSFileManager.defaultManager().fileExistsAtPath(filePath){
                let resultArray = NSArray(contentsOfFile: filePath)
             //   var arrayAppearencesDictionary: NSArray? = resultDictionary?.objectForKey(rootKey) as? NSArray
                var appearancesDictionaryArray = resultArray as Array<Dictionary<String, DictionaryObject>>
                
                return dictionaryApperancesToArrayApperances(appearancesDictionaryArray)
                
            }
        }
        return [AdaptiveButtonAppearance]()
    }
}
