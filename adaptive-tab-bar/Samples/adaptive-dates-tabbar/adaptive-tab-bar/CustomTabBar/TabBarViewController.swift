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
                tbi.image = tbi.image?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
            }
        }
    }
      
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateSelectionIndicatorImage()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        super.viewWillTransition(to: size, with: coordinator)
        DispatchQueue.main.async {
            self.updateSelectionIndicatorImage()
        }
    }
    
    private func updateSelectionIndicatorImage() {
        let selectionImageHorizontalOverlap: CGFloat = 6
        
        guard let sourceImage = UIImage(named: "backgroud_tab"),
         let itemFrame = tabBar.getFrameForTabAt(index: selectedIndex),
         let resizedImage = sourceImage.resized(width: itemFrame.width + selectionImageHorizontalOverlap, height: sourceImage.size.height) else { return }
        
        tabBar.selectionIndicatorImage = resizedImage
    }
}
