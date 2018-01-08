//
//  TabBarViewController.swift
//  adaptive-tab-bar
//
//  Created by Arcilite on 22.09.14.
//  Copyright (c) 2014 Ramotion. All rights reserved.
//

import QuartzCore
import UIKit
class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let version = Float(UIDevice().systemVersion), version >= 7.0 {
            tabBar.items?.forEach { tbi in
                tbi.image = tbi.image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            }
        }
    }
}
