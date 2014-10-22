//
//  ButtonStateApparenceProtocol.swift
//  AdaptiveController
//
//  Created by Arcilite on 22.10.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit

protocol ButtonStateAppearanceProtocol :AppearanceSerializationProtocol{

    var title: String?{get set}
    var font:  UIFont?{get set}
    var imageName: String?{get set}
    var backgroundImageName:String?{get set}
    var titleOffset:UIOffset?{get set}
    var imageInsets:UIEdgeInsets{get set}
    var titleColor:UIColor {get set}
    var backgroundColor:UIColor {get set}
    var enabled:Bool{get set}
    
    
}