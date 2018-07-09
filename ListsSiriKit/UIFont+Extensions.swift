//
//  UIFont+Extensions.swift
//  ListsSiriKit
//
//  Created by Guillian Balisi on 2018-07-09.
//  Copyright © 2018 Martin Mitrevski. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    enum HelveticaNeueWeight: String {
        case regular = ""
        case light = "-Light"
        case medium = "-Medium"
        case bold = "-Bold"
    }
    
    static func helvetica(ofSize size: CGFloat, weight: HelveticaNeueWeight = .regular) -> UIFont {
        return UIFont(name: "HelveticaNeue" + weight.rawValue, size: size)!
    }
    
    enum GeorgiaWeight: String {
        case regular = ""
        case bold = "-Bold"
    }
    
    static func georgia(ofSize size: CGFloat, weight: GeorgiaWeight = .regular) -> UIFont {
        return UIFont(name: "Georgia" + weight.rawValue, size: size)!
    }
}
