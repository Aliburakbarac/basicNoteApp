//
//  AuthTextField.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 31.07.2023.
//

import UIKit

class AuthReusableTextfield: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTextField()
    }
    
    private func setupTextField() {
        self.frame = CGRect(x: 0, y: 0, width: 327, height: 53)
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 0.886, green: 0.902, blue: 0.918, alpha: 1).cgColor
        self.setLeftPaddingPoints(18)
        self.placeholder = "Email Address"
        self.autocapitalizationType = .none
    }

    func setPlaceholder(_ placeholder: String) {
        self.placeholder = placeholder
    }
}
