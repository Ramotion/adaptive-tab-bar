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
       
        
        if (UIDevice().systemVersion as NSString).floatValue >= 7.0{
            for  tbi in self.tabBar.items as [UITabBarItem] {
                tbi.image = tbi.image?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
