//
//  AppearanceSerializationProtocol.swift
//  AdaptiveController
//
//  Created by Arcilite on 22.10.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import Foundation

protocol AppearanceSerializationProtocol {
    
    func getObjectDictionary() -> Dictionary<String,AnyObject>
    func setObjectDictionary(dictionary:Dictionary<String,AnyObject>)

}