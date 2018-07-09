//
//  DiaryHeaderCell.swift
//  ListsSiriKit
//
//  Created by Guillian Balisi on 2018-07-09.
//  Copyright © 2018 Martin Mitrevski. All rights reserved.
//

import Foundation
import UIKit

class DiaryHeaderCell: UICollectionViewCell {
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        label.textAlignment = .center
        contentView.addSubview(label)
        label.pinToSuperviewEdges(leading: 4, trailing: 4, top: 0, bottom: 0)
    }
}
