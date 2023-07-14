//
//  SignInViewController.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 14.07.2023.
//

import UIKit

private let loginLabel = UILabel()
private let loginSubLabel = UILabel()
private let signEmailField = UITextField()
private let signPasswordField = UITextField()
private let forgotButton = UIButton()
private let loginButton = UIButton()
private let alreadyLabel = UILabel()
private let signUpButton = UIButton()
private let errorIcon = UIImageView()
private let errorLabel = UILabel()
private var forgotButtonTopConstraint: NSLayoutConstraint!
private let validation = InputValidator()
private var isButtonTapped = false


final class SignInViewController: UIViewController,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        signEmailField.delegate = self
        signPasswordField.delegate = self
        
        view.backgroundColor = .systemBackground
        setLabels()
        setTextFields()
        setUpButtons()
        setErrorImage()
        setUpConstraints()
        hideKeyboardFunction()
        
        errorIcon.isHidden = true
        errorLabel.isHidden = true
        
        // Do any additional setup after loading the view.
    }
    private func setErrorImage(){
        errorIcon.frame = CGRect(x: 0, y: 0, width: 327, height: 82)
        errorIcon.image = UIImage(named: "ic_error")
        errorIcon.contentMode = UIView.ContentMode.scaleAspectFit
        view.addSubview(errorIcon)
    }
    private func setLabels(){
        loginLabel.frame = CGRect(x: 0, y: 0, width: 327, height: 31)
        loginLabel.textColor = UIColor(red: 0.137, green: 0.137, blue: 0.235, alpha: 1)
        loginLabel.font = .boldSystemFont(ofSize: 26)
        // Line height: 31 pt
        loginLabel.textAlignment = .center
        loginLabel.text = "Login"
        view.addSubview(loginLabel)
        
        loginSubLabel.frame = CGRect(x: 0, y: 0, width: 327, height: 18)
        loginSubLabel.textColor = UIColor(red: 0.514, green: 0.552, blue: 0.571, alpha: 1)
        loginSubLabel.font = UIFont(name: "Inter-Medium", size: 15)
        // Line height: 18 pt
        loginSubLabel.textAlignment = .center
        loginSubLabel.text = "Login or sign up to continue using our app."
        view.addSubview(loginSubLabel)
        
        alreadyLabel.frame = CGRect(x: 0, y: 0, width: 81, height: 18)
        alreadyLabel.textColor = UIColor(red: 0.545, green: 0.584, blue: 0.604, alpha: 1)
        alreadyLabel.font = UIFont(name: "Inter-Medium", size: 15)
        // Line height: 18 pt
        alreadyLabel.text = "New user?"
        view.addSubview(alreadyLabel)
        
        errorLabel.frame = CGRect(x: 0, y: 0, width: 89, height: 13)
        errorLabel.textColor = UIColor(red: 0.867, green: 0.173, blue: 0, alpha: 1)
        errorLabel.font = UIFont(name: "Inter-Medium", size: 11)
        // Line height: 13 pt
        errorLabel.text = "Password Invalid"
        view.addSubview(errorLabel)
        
    }
    private func setTextFields(){
        
        signEmailField.frame = CGRect(x: 0, y: 0, width: 327, height: 53)
        signEmailField.layer.cornerRadius = 5
        signEmailField.layer.borderWidth = 1
        signEmailField.layer.borderColor = UIColor(red: 0.886, green: 0.902, blue: 0.918, alpha: 1).cgColor
        signEmailField.setLeftPaddingPoints(18)
        signEmailField.placeholder = "Email Address"
        signEmailField.autocapitalizationType = .none
        view.addSubview(signEmailField)
        
        signPasswordField.frame = CGRect(x: 0, y: 0, width: 327, height: 53)
        signPasswordField.layer.cornerRadius = 5
        signPasswordField.layer.borderWidth = 1
        signPasswordField.layer.borderColor = UIColor(red: 0.886, green: 0.902, blue: 0.918, alpha: 1).cgColor
        signPasswordField.setLeftPaddingPoints(18)
        signPasswordField.placeholder = "Password"
        signPasswordField.isSecureTextEntry = true
        signPasswordField.autocapitalizationType = .none
        view.addSubview(signPasswordField)
        
    }
    private func setUpButtons(){
        
        forgotButton.frame = CGRect(x: 0, y: 0, width: 121, height: 17)
        forgotButton.titleLabel?.font = UIFont(name: "Inter-Medium", size: 14) ?? UIFont.systemFont(ofSize: 14)
        // Line height: 17 pt
        // (identical to box height)
        forgotButton.setTitle("Forgot Password?", for: .normal)
        forgotButton.setTitleColor(.black, for: .normal)
        forgotButton.addTarget(self, action: #selector(forgotButtonTapped), for: .touchUpInside)
        view.addSubview(forgotButton)
        
        loginButton.frame = CGRect(x: 0, y: 0, width: 327, height: 63)
        loginButton.backgroundColor = UIColor(red: 0.863, green: 0.863, blue: 1, alpha: 1)
        loginButton.layer.cornerRadius = 5
        loginButton.setTitle("Sign Up", for: .normal)
        loginButton.setTitleColor(UIColor(red: 0.545, green: 0.549, blue: 1, alpha: 1), for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 16)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        view.addSubview(loginButton)
        
        signUpButton.frame = CGRect(x: 0, y: 0, width: 87, height: 18)
        signUpButton.setTitleColor(UIColor(red: 0.55, green: 0.55, blue: 1, alpha: 1), for: .normal)
        signUpButton.titleLabel?.font = UIFont(name: "Inter-Medium", size: 15)
        // Line height: 18 pt
        signUpButton.setTitle("Sign up now", for: .normal)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        view.addSubview(signUpButton)
        
    }
    private func setUpConstraints(){
        forgotButtonTopConstraint = forgotButton.topAnchor.constraint(equalTo: signPasswordField.bottomAnchor, constant: 12)
        forgotButtonTopConstraint.isActive = true
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginSubLabel.translatesAutoresizingMaskIntoConstraints = false
        signEmailField.translatesAutoresizingMaskIntoConstraints = false
        signPasswordField.translatesAutoresizingMaskIntoConstraints = false
        forgotButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        alreadyLabel.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        errorIcon.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                                    
            loginLabel.widthAnchor.constraint(equalToConstant: 327),
            loginLabel.heightAnchor.constraint(equalToConstant: 31),
            loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 96),
            loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            loginSubLabel.widthAnchor.constraint(equalToConstant: 327),
            loginSubLabel.heightAnchor.constraint(equalToConstant: 18),
            loginSubLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 16),
            loginSubLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            loginSubLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
                                    
            signEmailField.widthAnchor.constraint(equalToConstant: 327),
            signEmailField.heightAnchor.constraint(equalToConstant: 53),
            signEmailField.topAnchor.constraint(equalTo: loginSubLabel.bottomAnchor, constant: 40),
            signEmailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            signEmailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            signPasswordField.widthAnchor.constraint(equalToConstant: 327),
            signPasswordField.heightAnchor.constraint(equalToConstant: 53),
            signPasswordField.topAnchor.constraint(equalTo: signEmailField.bottomAnchor, constant: 16),
            signPasswordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            signPasswordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            forgotButton.widthAnchor.constraint(equalToConstant: 121),
            forgotButton.heightAnchor.constraint(equalToConstant: 17),
            forgotButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 230),
            forgotButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            loginButton.widthAnchor.constraint(equalToConstant: 327),
            loginButton.heightAnchor.constraint(equalToConstant: 63),
            loginButton.topAnchor.constraint(equalTo: forgotButton.bottomAnchor, constant: 24),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            alreadyLabel.widthAnchor.constraint(equalToConstant: 81),
            alreadyLabel.heightAnchor.constraint(equalToConstant: 18),
            alreadyLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35),
            alreadyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 103),
            
            signUpButton.widthAnchor.constraint(equalToConstant: 94),
            signUpButton.heightAnchor.constraint(equalToConstant: 18),
            signUpButton.leadingAnchor.constraint(equalTo: alreadyLabel.trailingAnchor, constant: 3),
            signUpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35),
            
            errorIcon.widthAnchor.constraint(equalToConstant: 16),
            errorIcon.heightAnchor.constraint(equalToConstant: 16),
            errorIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            errorIcon.topAnchor.constraint(equalTo: signPasswordField.bottomAnchor, constant: 9),
            
            errorLabel.widthAnchor.constraint(equalToConstant: 200),
            errorLabel.heightAnchor.constraint(equalToConstant: 18),
            errorLabel.leadingAnchor.constraint(equalTo: errorIcon.trailingAnchor, constant: 5),
            errorLabel.topAnchor.constraint(equalTo: signPasswordField.bottomAnchor, constant: 8)
            
                                    ])
        
        
    }
    func showError(message: String, field: UITextField?) {
       
        field?.layer.borderColor = UIColor.red.cgColor
        field?.layer.borderWidth = 1.0
        errorIcon.isHidden = false
        errorLabel.isHidden = false
        errorLabel.text = message
        
        if errorLabel.isHidden {
            forgotButtonTopConstraint.constant = 12
        } else {
            forgotButtonTopConstraint.constant = 48
        }
        
       
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    @objc private func forgotButtonTapped(){
        
    }
    @objc private func loginButtonTapped(){
       
        }
    

    @objc private func signUpButtonTapped(){
        if isButtonTapped {
                return
            }
            
            isButtonTapped = true

            let signUpVC = RegisterViewController()
            navigationController?.pushViewController(signUpVC, animated: true)
        }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            isButtonTapped = false
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
