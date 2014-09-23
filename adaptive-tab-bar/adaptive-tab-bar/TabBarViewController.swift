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
       
       
        
          
//        var frame:CGRect  = CGRectMake(0.0, 0, self.view.bounds.size.width, 48)
//        var view = UIView(frame: frame);
//        view.backgroundColor = UIColor(red: 0.0, green: 0, blue: 0, alpha: 0.0)
//        self.tabBar.shadowImage = nil
//        self.tabBar.insertSubview(view, atIndex: 0)
        
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
