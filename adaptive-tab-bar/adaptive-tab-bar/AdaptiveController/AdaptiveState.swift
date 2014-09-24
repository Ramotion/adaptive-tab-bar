//
//  AdaptiveController.swift
//  AdaptiveTabBarControllerSample
//
//  Created by Arcilite on 17.09.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit


let kDefaultAdaptiveState:String = "DefaultAdaptiveState"


class AdaptiveState: NSObject {
   
    var currentItemState:NSString? 
    

    var  buttonStates:[String] = [String]()
     
    
    override init(){
        super.init()
        self.currentItemState = kDefaultAdaptiveState
        self.addNewCustomAdaptiveStates([kDefaultAdaptiveState])
    }
    
    internal func addNewCustomAdaptiveStates(customAdaptiveStates:Array<String>){
         self.buttonStates+customAdaptiveStates
    }
    
   
    
    
 
    
}
