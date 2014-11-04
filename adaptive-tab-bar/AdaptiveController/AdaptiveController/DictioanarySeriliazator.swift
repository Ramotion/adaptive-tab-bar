//
//  DictioanarySeriliazator.swift
//  AdaptiveController
//
//  Created by Arcilite on 04.11.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit

public class DictioanarySeriliazator: NSObject {
    
    func readDictionaryFromFile(filePath:String) -> Dictionary<String,AnyObject!>? {
        var anError : NSError?
        
        let data : NSData! = NSData(contentsOfFile:filePath, options: NSDataReadingOptions.DataReadingUncached, error: &anError)
        
        if let theError = anError{
            return nil
        }
        
        let dict : AnyObject! = NSPropertyListSerialization.propertyListWithData(data, options: 0,format: nil, error: &anError)
        
        if (dict != nil){
            if let ocDictionary = dict as? NSDictionary {
                var swiftDict : Dictionary<String,AnyObject!> = Dictionary<String,AnyObject!>()
                for key : AnyObject in ocDictionary.allKeys{
                    let stringKey : String = key as String
                    
                    if let keyValue : AnyObject = ocDictionary.valueForKey(stringKey){
                        swiftDict[stringKey] = keyValue
                    }
                }
                return swiftDict
            } else {
                return nil
            }
        } else if let theError = anError {
            println("Sorry, couldn't read the file \(filePath.lastPathComponent):\n\t"+theError.localizedDescription)
        }
        return nil
    }

    

    public func buttonApperancesToArrayDictionary(buttonApearances:[AdaptiveButtonAppearance]) -> Array<Dictionary<String, AnyObject>>{
        var buttonsAperancesDictionaryArray  =  Array<Dictionary<String, AnyObject>>()
        for appeareance in buttonApearances{
             buttonsAperancesDictionaryArray.append(appeareance.getObjectDictionary())
        }
        return buttonsAperancesDictionaryArray
    }
    
    public func saveStateDictionary(buttonApearances:[AdaptiveButtonAppearance],fileName:String){
        
        var paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        var path = paths.stringByAppendingPathComponent(fileName)
        println(path)
        var dataArray =  buttonApperancesToArrayDictionary(buttonApearances)
        var data : NSArray = dataArray as NSArray
        var fileManager = NSFileManager.defaultManager()
       
//        if (!(fileManager.fileExistsAtPath(path)))
//        {
//            var bundle : NSString = NSBundle.mainBundle().pathForResource("data", ofType: "plist")
//            fileManager.copyItemAtPath(bundle, toPath: path, error:nil)
//        }
       // data.setObject(object, forKey: "object")
        data.writeToFile(path, atomically: true)
        
    }
}
