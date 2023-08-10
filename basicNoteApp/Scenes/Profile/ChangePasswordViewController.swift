//
//  ChangePasswordViewController.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 4.08.2023.
//

import UIKit

class ChangePasswordViewController: BaseViewController {
    
    var passwordField: AuthReusableTextfield = {
       let textField = AuthReusableTextfield()
        textField.setPlaceholder("Password")
        textField.isSecureTextEntry = true
        textField.font = .title4()
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return textField
    }()
    var newPasswordField:AuthReusableTextfield = {
        let textField = AuthReusableTextfield()
         textField.setPlaceholder("New Password")
        textField.isSecureTextEntry = true
        textField.font = .title4()
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
         return textField
    }()
    var retypeField: AuthReusableTextfield = {
        let textField = AuthReusableTextfield()
         textField.setPlaceholder("Retype New Password")
        textField.isSecureTextEntry = true
        textField.font = .title4()
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
         return textField
    }()
    var saveButton: ReusableButtonStackView = {
       let button = ReusableButtonStackView()
        button.setButtonTitle("Save")
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        checkTextFields()
        setUpView()
        applyConstraints()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = "Change Password"
    }

    private func setUpView(){
    
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
