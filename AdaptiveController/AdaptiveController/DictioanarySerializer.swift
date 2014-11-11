//
//  DictioanarySeriliazator.swift
//  AdaptiveController
//
//  Created by Arcilite on 04.11.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit

public class DictioanarySerializer: NSObject {

    public typealias DictionaryObject = Dictionary <String,AnyObject>
    
   
    public func buttonApperancesToArrayDictionary(buttonApearances:[AdaptiveButtonAppearance]) -> Array<Dictionary<String, AnyObject>>{
        var buttonsApearancesDictionaryArray  =  Array<Dictionary<String, AnyObject>>()
        for appeareance in buttonApearances{
             buttonsApearancesDictionaryArray.append(appeareance.getObjectDictionary())
        }
        return buttonsApearancesDictionaryArray
    }
    
    public func saveStateDictionary(buttonApearances:[AdaptiveButtonAppearance],filePath:String){
        
        var dataArray =  buttonApperancesToArrayDictionary(buttonApearances)
        var data : NSArray = dataArray as NSArray
        data.writeToFile(filePath, atomically: true)
        
    }
    
    public func dictionaryAppearancesToArrayApperances(buttonApearancesDictionary:Array<Dictionary<String, DictionaryObject>>) -> [AdaptiveButtonAppearance]{
        var buttonsApearancesDictionaryArray  = [AdaptiveButtonAppearance]()
        for appeareanceDictionary in buttonApearancesDictionary{
            var appearance = AdaptiveButtonAppearance()
            appearance.setObjectDictionary(appeareanceDictionary)
            buttonsApearancesDictionaryArray.append(appearance)
        }
        return buttonsApearancesDictionaryArray
    }
    
    
    public func parseFromPlistToButtonAppearances(filePath:String)->[AdaptiveButtonAppearance] {
        
        if countElements(filePath) > 0 {
            // The file saved previously
            
            // Check for existence of the file
            if NSFileManager.defaultManager().fileExistsAtPath(filePath){
                let resultArray = NSArray(contentsOfFile: filePath)
                var appearancesDictionaryArray = resultArray as Array<Dictionary<String, DictionaryObject>>
                
                return dictionaryAppearancesToArrayApperances(appearancesDictionaryArray)
                
            }
        }
        return [AdaptiveButtonAppearance]()
    }
}
