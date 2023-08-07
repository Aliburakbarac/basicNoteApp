//
//  ProfileViewController.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 4.08.2023.
//

import UIKit

class ProfileViewController: BaseViewController {
    
    var fullNameField = AuthReusableTextfield()
    var emailField = AuthReusableTextfield()
    var saveButton = ReusableButtonStackView()
    var changeButton = UIButton()
    var signOutButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUpView()
        applyConstraints()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = "Profile"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = ""
    }
    private func setUpView(){
        
        fullNameField.setPlaceholder("Full Name")
        emailField.setPlaceholder("Email Adress")
        saveButton.setButtonTitle("Save")
        saveButton.colorChange()
        
        view.addSubview(fullNameField)
        view.addSubview(emailField)
        view.addSubview(saveButton)
        
        changeButton.frame = CGRect(x: 0, y: 0, width: 123, height: 17)
        changeButton.titleLabel?.font = UIFont(name: "Inter-Medium", size: 14) ?? UIFont.systemFont(ofSize: 14)
        changeButton.setTitle("Change Password?", for: .normal)
        changeButton.setTitleColor(UIColor(red: 0.545, green: 0.549, blue: 1, alpha: 1), for: .normal)
        changeButton.addTarget(self, action: #selector(changeButtonTapped), for: .touchUpInside)
        
        
        
        signOutButton.frame = CGRect(x: 0, y: 0, width: 59, height: 17)
        signOutButton.titleLabel?.font = UIFont(name: "Inter-Medium", size: 14) ?? UIFont.systemFont(ofSize: 14)
        signOutButton.setTitle("Sign Out", for: .normal)
        signOutButton.setTitleColor(UIColor(red: 0.867, green: 0.173, blue: 0, alpha: 1), for: .normal)
        signOutButton.addTarget(self, action: #selector(signOutButtonTapped), for: .touchUpInside)
        
        
        
        view.addSubview(changeButton)
        view.addSubview(signOutButton)
        
        
    }
    private func applyConstraints(){
        
        fullNameField.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        changeButton.translatesAutoresizingMaskIntoConstraints = false
        signOutButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
        
            fullNameField.widthAnchor.constraint(equalToConstant: 327),
            fullNameField.heightAnchor.constraint(equalToConstant: 53),
            fullNameField.topAnchor.constraint(equalTo: view.topAnchor, constant: 112),
            fullNameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            fullNameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            emailField.widthAnchor.constraint(equalToConstant: 327),
            emailField.heightAnchor.constraint(equalToConstant: 53),
            emailField.topAnchor.constraint(equalTo: fullNameField.bottomAnchor, constant: 16),
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
        
            saveButton.widthAnchor.constraint(equalToConstant: 327),
            saveButton.heightAnchor.constraint(equalToConstant: 63),
            saveButton.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 24),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            changeButton.widthAnchor.constraint(equalToConstant: 123),
            changeButton.heightAnchor.constraint(equalToConstant: 17),
            changeButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 16),
            changeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 126),
            changeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -126),
            
            signOutButton.widthAnchor.constraint(equalToConstant: 59),
            signOutButton.heightAnchor.constraint(equalToConstant: 17),
            signOutButton.topAnchor.constraint(equalTo: changeButton.bottomAnchor, constant: 8),
            signOutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 158),
            signOutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -158),
            
            
        
        
        ])
        
    }

    @objc func changeButtonTapped(){
        let changeVC = ChangePasswordViewController()
        navigationController?.pushViewController(changeVC, animated: true)
        
    }

    @objc func signOutButtonTapped(){
        navigationController?.pushViewController(SignInViewController(), animated: true)
        
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
