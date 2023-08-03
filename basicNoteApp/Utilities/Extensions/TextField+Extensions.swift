//
//  TextField+Extensions.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 13.07.2023.
//

import Foundation
import UIKit

extension UITextField: UITextFieldDelegate {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
}

extension RegisterViewController {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(red: 0.55, green: 0.55, blue: 1, alpha: 1).cgColor
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(red: 0.886, green: 0.902, blue: 0.918, alpha: 1).cgColor
    }
}
extension SignInViewController {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(red: 0.55, green: 0.55, blue: 1, alpha: 1).cgColor
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(red: 0.886, green: 0.902, blue: 0.918, alpha: 1).cgColor
    }
}

extension ForgotPasswordViewController {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(red: 0.55, green: 0.55, blue: 1, alpha: 1).cgColor
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(red: 0.886, green: 0.902, blue: 0.918, alpha: 1).cgColor
    }
}

