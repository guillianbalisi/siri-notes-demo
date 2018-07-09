//
//  LineView.swift
//  ListsSiriKit
//
//  Created by Guillian Balisi on 2018-07-09.
//  Copyright © 2018 Martin Mitrevski. All rights reserved.
//

import Foundation
import UIKit

class LineView: UIView {
    
    enum Axis {
        case vertical, horizontal
    }
    
    init(_ axis: Axis, color: UIColor, size: CGFloat) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        switch axis {
        case .vertical:
            widthAnchor.constraint(equalToConstant: size).isActive = true
        case .horizontal:
            heightAnchor.constraint(equalToConstant: size).isActive = true
        }
        backgroundColor = color
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
