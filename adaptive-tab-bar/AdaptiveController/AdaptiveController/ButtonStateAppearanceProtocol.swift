//
//  ButtonStateApparenceProtocol.swift
//  AdaptiveController
//
//  Created by Arcilite on 22.10.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit

protocol ButtonStateAppearanceProtocol {

    var title: String?{get set}
    var fontSize:  Float?{get set}
    var fontFamily:  String?{get set}
    var imageName: String?{get set}
    var backgroundImageName:String?{get set}
    
    func getObjectDictionary() -> Dictionary
    func setObjectDictionary(dictionary:Dictionary)
}