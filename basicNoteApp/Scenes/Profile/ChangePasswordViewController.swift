//
//  ChangePasswordViewController.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 4.08.2023.
//

import UIKit

class ChangePasswordViewController: BaseViewController,UITextFieldDelegate {
    
    var passwordField = AuthReusableTextfield()
    var newPasswordField = AuthReusableTextfield()
    var retypeField = AuthReusableTextfield()
    var saveButton = ReusableButtonStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        passwordField.delegate = self
        newPasswordField.delegate = self
        retypeField.delegate = self
        passwordField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        retypeField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        newPasswordField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        checkTextFields()
        setUpView()
        applyConstraints()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = "Change Password"
    }

    private func setUpView(){
        
        passwordField.setPlaceholder("Password")
        newPasswordField.setPlaceholder("New Password")
        retypeField.setPlaceholder("Retype New Password")
        saveButton.setButtonTitle("Save")
        
        passwordField.isSecureTextEntry = true
        newPasswordField.isSecureTextEntry = true
        retypeField.isSecureTextEntry = true
        
        passwordField.font = UIFont(name: "Inter-Medium", size: 14) ?? UIFont.systemFont(ofSize: 14)
        newPasswordField.font = UIFont(name: "Inter-Medium", size: 14) ?? UIFont.systemFont(ofSize: 14)
        retypeField.font = UIFont(name: "Inter-Medium", size: 14) ?? UIFont.systemFont(ofSize: 14)
        
        view.addSubview(passwordField)
        view.addSubview(newPasswordField)
        view.addSubview(retypeField)
        view.addSubview(saveButton)
        
        
    }
    private func applyConstraints(){
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        newPasswordField.translatesAutoresizingMaskIntoConstraints = false
        retypeField.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            
            passwordField.widthAnchor.constraint(equalToConstant: 327),
            passwordField.heightAnchor.constraint(equalToConstant: 53),
            passwordField.topAnchor.constraint(equalTo: view.topAnchor, constant: 112),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            newPasswordField.widthAnchor.constraint(equalToConstant: 327),
            newPasswordField.heightAnchor.constraint(equalToConstant: 53),
            newPasswordField.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 16),
            newPasswordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            newPasswordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            retypeField.widthAnchor.constraint(equalToConstant: 327),
            retypeField.heightAnchor.constraint(equalToConstant: 53),
            retypeField.topAnchor.constraint(equalTo: newPasswordField.bottomAnchor, constant: 16),
            retypeField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            retypeField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            saveButton.widthAnchor.constraint(equalToConstant: 327),
            saveButton.heightAnchor.constraint(equalToConstant: 63),
            saveButton.topAnchor.constraint(equalTo: retypeField.bottomAnchor, constant: 24),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
            
            
        
        
        
        
        ])
        
        
        
    }
    public func checkTextFields() {
            if let text1 = retypeField.text, !text1.isEmpty,
               let text2 = newPasswordField.text, !text2.isEmpty,
               let text3 = passwordField.text, !text3.isEmpty {
                
                saveButton.isEnabled()
            } else {
               
            }
        }
    @objc func textFieldDidChange(_ textField: UITextField) {
            checkTextFields()
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
