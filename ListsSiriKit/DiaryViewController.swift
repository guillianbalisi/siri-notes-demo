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
        table.register(DiaryCell.self, forCellReuseIdentifier: "DiaryCell")
        table.separatorStyle = .none
        table.dataSource = dataSourceDelegate
        table.delegate = dataSourceDelegate
        table.tableFooterView = UIView()
        table.tableHeaderView = headerView
        return table
    }()
    
    private lazy var headerView: DiaryHeaderView = {
        let view = DiaryHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.width, height: 50))
        return view
    }()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupSubviews()
    }
    
    // MARK: - Actions
    
    @objc func addButtonTapped() {
        
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
        
        bar.largeTitleTextAttributes = [NSAttributedStringKey.font: UIFont.georgia(ofSize: 36, weight: .bold)]
        bar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.georgia(ofSize: 18, weight: .bold)]
//        bar.layer.shadowOffset = CGSize(width: 0, height: 2)
//        bar.layer.shadowRadius = 16
//        bar.layer.shadowColor = UIColor.darkGray.cgColor
//        bar.layer.shadowOpacity = 0.15
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
