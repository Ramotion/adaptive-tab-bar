//
//  TabBarViewController.swift
//  adaptive-tab-bar
//
//  Created by Arcilite on 22.09.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import UIKit
import QuartzCore
class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        if let version = Float(UIDevice().systemVersion), version >= 7.0 {
            for  tbi in self.tabBar.items as [UITabBarItem] {
                tbi.image = tbi.image?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            }
        }
    }    
}
