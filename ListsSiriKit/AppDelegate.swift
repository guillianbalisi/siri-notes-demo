//
//  AppDelegate.swift
//  ListsSiriKit
//
//  Created by Martin Mitrevski on 24.06.17.
//  Copyright © 2017 Martin Mitrevski. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        print(NotesManager.shared.notes)
        
        setupWindow()
        
        return true
    }
}

extension AppDelegate {
    private func setupWindow() {
        window = UIWindow()
        
        let tabBarController = TabBarController()
        let one = createTabViewController(image: #imageLiteral(resourceName: "home"), tag: 0, rootVC: UIViewController())
        let two = createTabViewController(image: #imageLiteral(resourceName: "diary"), tag: 1, rootVC: DiaryViewController())
        let three = createTabViewController(image: #imageLiteral(resourceName: "stethoscope"), tag: 2, rootVC: UIViewController())
        let four = createTabViewController(image: #imageLiteral(resourceName: "person"), tag: 3, rootVC: UIViewController())
        tabBarController.viewControllers = [one, two, three, four]
        tabBarController.selectedIndex = 1
        
        window?.rootViewController = tabBarController
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
    }
    
    private func createTabViewController(title: String? = " ", image: UIImage, tag: Int,
                                         rootVC: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootVC)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.tabBarItem = UITabBarItem(title: title,
                                                       image: image.withRenderingMode(.alwaysTemplate),
                                                       tag: tag)
        
        return navigationController
    }
}

