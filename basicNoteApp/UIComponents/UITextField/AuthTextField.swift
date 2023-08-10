//
//  AuthTextField.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 31.07.2023.
//


import UIKit

class AuthReusableTextfield: UITextField {
    
    var placeholderTitle = String()
    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.appGray
        label.font = .title6()
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTextField()
    }
    
    private func setupTextField() {
        delegate = self
        self.frame = CGRect(x: 0, y: 0, width: 327, height: 53)
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.appLightGray.cgColor
        self.setLeftPaddingPoints(18)
        self.autocapitalizationType = .none
        
        addSubview(placeholderLabel)
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        placeholderLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        placeholderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18).isActive = true
        placeholderLabel.isHidden = !text!.isEmpty
        
        addTarget(self, action: #selector(editingDidBegin), for: .editingDidBegin)
        addTarget(self, action: #selector(editingDidEnd), for: .editingDidEnd)
        
        placeholderLabel.isHidden = true
    }
    
    @objc private func editingDidBegin() {
        placeholderLabel.isHidden = false
        self.placeholder = ""
        UIView.animate(withDuration: 0.2) {
            self.placeholderLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }

    @objc private func editingDidEnd() {
        if text!.isEmpty {
            UIView.animate(withDuration: 0.2) { [self] in
                self.placeholderLabel.isHidden = true
                self.placeholderLabel.transform = .identity
                self.placeholder = placeholderTitle
                
            }
        }
    }
    func setPlaceholder(_ placeholder: String) {
        self.placeholder = placeholder
        placeholderTitle = placeholder
        placeholderLabel.text = placeholder
    }
}
extension AuthReusableTextfield: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.layer.borderColor = UIColor.appPurple.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.layer.borderColor = UIColor.appLightGray.cgColor
    }
   
}
    
    
    

