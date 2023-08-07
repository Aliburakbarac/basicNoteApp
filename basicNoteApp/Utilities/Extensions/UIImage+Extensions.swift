//
//  UIImage+Extensions.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 3.08.2023.
//

import UIKit

extension UIImage {
    func roundedImageWith(size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let path = UIBezierPath(roundedRect: CGRect(origin: .zero, size: size), cornerRadius: size.height / 2)
        path.addClip()
        self.draw(in: CGRect(origin: .zero, size: size))
        let roundedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return roundedImage?.withRenderingMode(.alwaysOriginal)
    }
}

