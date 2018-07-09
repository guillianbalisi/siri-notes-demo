//
//  TabBarController.swift
//  ListsSiriKit
//
//  Created by Guillian Balisi on 2018-07-09.
//  Copyright © 2018 Martin Mitrevski. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    private lazy var defaultTabBarHeight = tabBar.frame.size.height
    
    var tabBarHeight: CGFloat = 0
    
    override func viewDidLoad() {
        tabBar.barTintColor = UIColor.white
        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor.primaryRed
        tabBar.unselectedItemTintColor = UIColor.gray
        
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 3)
        tabBar.layer.shadowRadius = 20
        tabBar.layer.shadowColor = UIColor.darkGray.cgColor
        tabBar.layer.shadowOpacity = 0.2
    
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        tabBarHeight = defaultTabBarHeight + 16
        
        var newFrame = tabBar.frame
        newFrame.size.height = tabBarHeight
        newFrame.origin.y = view.frame.size.height - tabBarHeight
        
        tabBar.frame = newFrame
    }
}
