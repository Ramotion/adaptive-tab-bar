//
//  AppearanceSerializationProtocol.swift
//  AdaptiveController
//
//  Created by Arcilite on 22.10.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import Foundation

protocol AppearanceSerializationProtocol {
    typealias DictionaryObject
    func getObjectDictionary() -> Dictionary<String,DictionaryObject>
    func setObjectDictionary(dictionary:Dictionary<String,DictionaryObject>)

}