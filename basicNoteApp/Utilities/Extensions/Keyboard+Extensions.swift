//
//  Keyboard+Extensions.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 14.07.2023.
//

import Foundation
import UIKit
extension UIViewController {
    func hideKeyboardFunction(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
     @objc private func hideKeyboard(){
        
        self.view.endEditing(true)
        
        
    }
}

