//
//  DiaryCell.swift
//  ListsSiriKit
//
//  Created by Guillian Balisi on 2018-07-09.
//  Copyright © 2018 Martin Mitrevski. All rights reserved.
//

import Foundation
import UIKit

class DiaryCell: UITableViewCell {
    
    static let height: CGFloat = 140
    
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
        let view = createMainView()
        contentView.addSubview(view)
        view.pinToSuperviewEdges(leading: 80, trailing: 14, top: 16, bottom: 16)
    }
    
    private func createMainView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        
        view.layer.shadowColor = UIColor.darkGray.cgColor
        view.layer.shadowOffset = CGSize(width: -12, height: -5)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.12
        let shadowPathFrame = CGRect(x: 10, y: 10, width: UIScreen.width - 10,
                                     height: DiaryCell.height - 32)
        view.layer.shadowPath = UIBezierPath(roundedRect: shadowPathFrame, cornerRadius: 10).cgPath
        return view
    }
}
