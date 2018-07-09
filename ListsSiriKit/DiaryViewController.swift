//
//  DiaryViewController.swift
//  ListsSiriKit
//
//  Created by Guillian Balisi on 2018-07-09.
//  Copyright © 2018 Martin Mitrevski. All rights reserved.
//

import Foundation
import UIKit

class DiaryViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Symptom Diary"
        
        let addItem = UIBarButtonItem(image: #imageLiteral(resourceName: "add").withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(addButtonTapped))
        navigationItem.setRightBarButton(addItem, animated: true)
        
        guard let bar = navigationController?.navigationBar else { return }
        bar.tintColor = UIColor.primaryRed
        bar.barTintColor = UIColor.white
        bar.isTranslucent = false
        bar.setValue(true, forKey: "hidesShadow")
        
        bar.layer.shadowOffset = CGSize(width: 0, height: 2)
        bar.layer.shadowRadius = 16
        bar.layer.shadowColor = UIColor.darkGray.cgColor
        bar.layer.shadowOpacity = 0.15
    }
    
    @objc func addButtonTapped() {
        
    }
}
