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
    
    private let topLine: LineView = {
        let line = LineView(.vertical, color: UIColor.primaryRed, size: 3)
        line.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return line
    }()
    
    private let bottomLine: LineView = {
        let line = LineView(.vertical, color: UIColor.primaryRed, size: 3)
        line.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return line
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = UIColor.clear
        
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell(isFirstCell: Bool, isLastCell: Bool) {
        topLine.isHidden = isFirstCell
        bottomLine.isHidden = isLastCell
    }
    
    private func setupSubviews() {
        let view = createMainView()
        contentView.addSubview(view)
        view.pinToSuperviewEdges(leading: 80, trailing: 14, top: 16, bottom: 16)
        
        let sideView = createSideView()
        contentView.addSubview(sideView)
        NSLayoutConstraint.activate([
            sideView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            sideView.trailingAnchor.constraint(equalTo: view.leadingAnchor),
            sideView.topAnchor.constraint(equalTo: contentView.topAnchor),
            sideView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
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
    
    private func createSideView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let circle = UIView()
        circle.layer.cornerRadius = 11
        circle.backgroundColor = UIColor.primaryRed
        circle.translatesAutoresizingMaskIntoConstraints = false
        
        let innerCircle = UIView()
        innerCircle.layer.cornerRadius = 8
        innerCircle.backgroundColor = UIColor.white
        innerCircle.translatesAutoresizingMaskIntoConstraints = false
        
        circle.addSubview(innerCircle)
        NSLayoutConstraint.activate([
            innerCircle.centerXAnchor.constraint(equalTo: circle.centerXAnchor),
            innerCircle.centerYAnchor.constraint(equalTo: circle.centerYAnchor),
            innerCircle.widthAnchor.constraint(equalToConstant: 16),
            innerCircle.heightAnchor.constraint(equalToConstant: 16)
            ])
        
        view.addSubview(circle)
        NSLayoutConstraint.activate([
            circle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            circle.widthAnchor.constraint(equalToConstant: 22),
            circle.heightAnchor.constraint(equalToConstant: 22)
            ])
        
        view.addSubview(topLine)
        NSLayoutConstraint.activate([
            topLine.topAnchor.constraint(equalTo: view.topAnchor),
            topLine.bottomAnchor.constraint(equalTo: circle.topAnchor, constant: -2),
            topLine.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        
        view.addSubview(bottomLine)
        NSLayoutConstraint.activate([
            bottomLine.topAnchor.constraint(equalTo: circle.bottomAnchor, constant: 2),
            bottomLine.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomLine.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        
        return view
    }
}



















