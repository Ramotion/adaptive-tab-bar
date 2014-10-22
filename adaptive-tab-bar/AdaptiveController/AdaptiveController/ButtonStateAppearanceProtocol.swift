//
//  ButtonStateApparenceProtocol.swift
//  AdaptiveController
//
//  Created by Arcilite on 22.10.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit

protocol ButtonStateAppearanceProtocol :AppearanceSerializationProtocol{

    var title: AnyObject?{get set}
    var font:  AnyObject?{get set}
    var imageName: AnyObject?{get set}
    var backgroundImageName:AnyObject?{get set}
    var titleOffset:AnyObject?{get set}
    var imageInsets:AnyObject?{get set}
    var titleColor:AnyObject?{get set}
    var backgroundColor:AnyObject?{get set}
    var enabled:Bool?{get set}
    
    
}