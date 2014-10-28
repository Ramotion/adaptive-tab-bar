//
//  AppearanceSerializationProtocol.swift
//  AdaptiveController
//
//  Created by Arcilite on 22.10.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import Foundation

protocol AppearanceSerializationProtocol {
    typealias StateObject
    func getObjectDictionary() -> Dictionary<String,StateObject>
    func setObjectDictionary(dictionary:Dictionary<String,StateObject>)

}