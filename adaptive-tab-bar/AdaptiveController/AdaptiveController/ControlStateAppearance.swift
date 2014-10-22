//
//  ControlStateAppearance.swift
//  AdaptiveController
//
//  Created by Arcilite on 22.10.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit

public class ControlStateAppearance: AppearanceSerializationProtocol{
    var title: String?
    var font:  UIFont?
    var imageName: String?
    var backgroundImageName:String?
    var titleOffset:UIOffset?
    var imageInsets:UIEdgeInsets?
    var titleColor:UIColor?
    var backgroundColor:UIColor?
    var enabled:Bool?
    
    func getObjectDictionary() -> Dictionary<String,AnyObject>{
    
        return Dictionary()
    }
    
    func setObjectDictionary(dictionary:Dictionary<String,AnyObject>){
    
    }

}
