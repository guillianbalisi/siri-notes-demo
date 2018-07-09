//
//  UIView+Extensions.swift
//  ListsSiriKit
//
//  Created by Guillian Balisi on 2018-07-09.
//  Copyright © 2018 Martin Mitrevski. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func pinToSuperviewEdges(leading: CGFloat? = 0,
                             trailing: CGFloat? = 0,
                             top: CGFloat? = 0,
                             bottom: CGFloat? = 0, bottomSafe: Bool = false) {
        guard let superview = superview else { preconditionFailure("View has no superview") }
        translatesAutoresizingMaskIntoConstraints = false
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: superview.leadingAnchor,
                                     constant: leading).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: superview.trailingAnchor,
                                      constant: -1 * trailing).isActive = true
        }
        
        if let top = top {
            topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor,
                                 constant: top).isActive = true
        }
        
        if let bottom = bottom {
            let superviewBottomAnchor = bottomSafe ? superview.safeAreaLayoutGuide.bottomAnchor :
                superview.bottomAnchor
            bottomAnchor.constraint(equalTo: superviewBottomAnchor,
                                    constant: -1 * bottom).isActive = true
        }
    }
}
