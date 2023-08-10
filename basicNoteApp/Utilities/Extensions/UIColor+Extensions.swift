//
//  UIColor+Extensions.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 10.08.2023.
//

import Foundation
import UIKit

extension UIColor {
    static func fromRGBA(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat) -> UIColor {
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }
    
    static var appPurple: UIColor {
        return UIColor.fromRGBA(139, 140, 255, 1)
    }
    
    static var appLightPurple: UIColor {
        return UIColor.fromRGBA(220, 220, 255, 1)
    }
    static var appBlack: UIColor {
        return UIColor.fromRGBA(35, 35, 60, 1)
    }
    static var appGray: UIColor {
        return UIColor.fromRGBA(131, 141, 146, 1)
    }
    static var appRed: UIColor {
        return UIColor.fromRGBA(221, 40, 0, 1)
    }
    static var appGreen: UIColor {
        return UIColor.fromRGBA(108, 197, 124, 1)
    }
    static var appYellow: UIColor {
        return UIColor.fromRGBA(255, 209, 100, 1)
    }
    static var appLightGray: UIColor {
        return UIColor.fromRGBA(226, 230, 234, 1)
    }
}
