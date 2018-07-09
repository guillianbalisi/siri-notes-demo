//
//  DiaryHeaderView.swift
//  ListsSiriKit
//
//  Created by Guillian Balisi on 2018-07-09.
//  Copyright © 2018 Martin Mitrevski. All rights reserved.
//

import Foundation
import UIKit

class DiaryHeaderView: UIView {
    
    private let months = DateFormatter().shortMonthSymbols!
    
    var selectedMonth: Int
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 50, height: 40)
        layout.scrollDirection = .horizontal
        
        let frame = CGRect(x: 0, y: 10, width: UIScreen.width, height: 40)
        
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.register(DiaryHeaderCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.clear
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        let month = Calendar.current.component(.month, from: Date())-1
        selectedMonth = month
        super.init(frame: frame)
        setupSubviews()
        collectionView.scrollToItem(at: IndexPath(row: month, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addSubview(collectionView)
    }
}

extension DiaryHeaderView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return months.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
            as? DiaryHeaderCell else { fatalError() }
        
        let month = months[indexPath.row]
        
        cell.label.textColor = indexPath.row == selectedMonth ? UIColor.primaryRed : UIColor.black
        cell.label.font = UIFont.georgia(ofSize: 17, weight: indexPath.row == selectedMonth ? .bold : .regular)
        cell.label.text = month
        
        return cell
    }
}

extension DiaryHeaderView: UICollectionViewDelegate {
    
}
