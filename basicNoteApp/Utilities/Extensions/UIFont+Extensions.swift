//
//  UIFont+Extensions.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 10.08.2023.
//

import Foundation
import UIKit

extension UIFont {
    static func title1(weight: UIFont.Weight = .semibold) -> UIFont {
            return UIFont(name: "Inter-SemiBold", size: 26) ?? UIFont.systemFont(ofSize: 26, weight: weight)
        }
    static func title2(weight: UIFont.Weight = .semibold) -> UIFont {
            return UIFont(name: "Inter-SemiBold", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: weight)
        }
    static func title3(weight: UIFont.Weight = .medium) -> UIFont {
            return UIFont(name: "Inter-Medium", size: 15) ?? UIFont.systemFont(ofSize: 15, weight: weight)
        }
    static func title4(weight: UIFont.Weight = .semibold) -> UIFont {
            return UIFont(name: "Inter-SemiBold", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: weight)
        }
    static func title5(weight: UIFont.Weight = .medium) -> UIFont {
            return UIFont(name: "Inter-Medium", size: 13) ?? UIFont.systemFont(ofSize: 13, weight: weight)
        }
    static func title6(weight: UIFont.Weight = .medium) -> UIFont {
            return UIFont(name: "Inter-Medium", size: 11) ?? UIFont.systemFont(ofSize: 11, weight: weight)
        }
    static func title22(weight: UIFont.Weight = .semibold) -> UIFont {
            return UIFont(name: "Inter-Semibold", size: 22) ?? UIFont.systemFont(ofSize: 22, weight: weight)
        }
}
