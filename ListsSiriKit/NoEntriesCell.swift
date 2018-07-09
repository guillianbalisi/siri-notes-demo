//
//  NoEntriesCell.swift
//  ListsSiriKit
//
//  Created by Guillian Balisi on 2018-07-09.
//  Copyright © 2018 Martin Mitrevski. All rights reserved.
//

import Foundation
import UIKit

class NoEntriesCell: UITableViewCell {
    
    private let months = DateFormatter().monthSymbols!
    private let label = UILabel()

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = UIColor.clear
        
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        label.textColor = UIColor.lightGray
        label.textAlignment = .center
        label.font = UIFont.georgia(ofSize: 24)
        label.numberOfLines = 2
        
        contentView.addSubview(label)
        label.pinToSuperviewEdges(leading: 0, trailing: 0, top: 20, bottom: 0)
    }
    
    func setText(month: Int) {
        label.text = "No Diary Entries for \(months[month])"
    }
}
