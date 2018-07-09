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
    
    private lazy var dataSourceDelegate = DiaryDataSourceDelegate()
    
    private lazy var table: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = dataSourceDelegate
        table.delegate = dataSourceDelegate
        table.tableFooterView = UIView()
        return table
    }()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupSubviews()
        registerForNotifications()
    }
    
    private func registerForNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleAppOpen), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
    }
    
    // MARK: - Actions
    
    @objc func addButtonTapped() {
        
    }
    
    @objc func handleAppOpen() {
        table.reloadData()
    }
}

// MARK: - View

extension DiaryViewController {
    private func setupNavigationBar() {
        navigationItem.title = "Symptom Diary"
        
        let filterItem = UIBarButtonItem(image: #imageLiteral(resourceName: "filter").withRenderingMode(.alwaysTemplate), style: .plain, target: nil, action: nil)
        navigationItem.setLeftBarButton(filterItem, animated: true)
        
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
    
    private func setupSubviews() {
        view.addSubview(table)
        NSLayoutConstraint.activate([
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
}
