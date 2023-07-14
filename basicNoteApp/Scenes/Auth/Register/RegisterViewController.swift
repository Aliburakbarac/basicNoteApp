//
//  RegisterViewController.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 12.07.2023.
//

import UIKit

 final class RegisterViewController: UIViewController, UITextFieldDelegate {
    private let signUpLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let fullnameField = UITextField()
    private let emailField = UITextField()
    private let passwordField = UITextField()
    private let forgotButton = UIButton()
    private let signUpButton = UIButton()
    private let alreadyLabel = UILabel()
    private let signInButton = UIButton()
    private let errorLabel = UILabel()
    private let errorIcon = UIImageView()
    private var forgotButtonTopConstraint: NSLayoutConstraint!
    private let validation = InputValidator()
    
    private var registerViewModel: RegisterViewModel!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullnameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        hideKeyboardFunction()
        view.backgroundColor = .systemBackground
        setUpLabel()
        setUpTextFields()
        setUpButtons()
        setUpImages()
        applyConstraints()
        
        errorIcon.isHidden = true
        errorLabel.isHidden = true
        
        
        
        registerViewModel = RegisterViewModel(registerAPI: RegisterAPI())
        
        
      
        // Do any additional setup after loading the view.
    }
    
     func setUpImages(){
         errorIcon.frame = CGRect(x: 0, y: 0, width: 16, height: 16)
         errorIcon.image = UIImage(named: "ic_error")
         view.addSubview(errorIcon)
         
     }
    func setUpLabel(){
        signUpLabel.frame = CGRect(x: 0, y: 0, width: 327, height: 31)
        signUpLabel.textColor = UIColor(red: 0.137, green: 0.137, blue: 0.235, alpha: 1)
        signUpLabel.font = .boldSystemFont(ofSize: 26)
        // Line height: 31 pt
        signUpLabel.textAlignment = .center
        signUpLabel.text = "Sign Up"
        view.addSubview(signUpLabel)
        
        subtitleLabel.frame = CGRect(x: 0, y: 0, width: 327, height: 18)
        subtitleLabel.textColor = UIColor(red: 0.514, green: 0.552, blue: 0.571, alpha: 1)
        subtitleLabel.font = UIFont(name: "Inter-Medium", size: 15)
        // Line height: 18 pt
        subtitleLabel.textAlignment = .center
        subtitleLabel.text = "Login or sign up to continue using our app."
        view.addSubview(subtitleLabel)
        
        alreadyLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 18)
        alreadyLabel.textColor = UIColor(red: 0.51, green: 0.55, blue: 0.57, alpha: 1)
        alreadyLabel.font = UIFont(name: "Inter-Medium", size: 15)
        // Line height: 18 pt
        alreadyLabel.text = "Already have an account?"
        view.addSubview(alreadyLabel)
        
        errorLabel.frame = CGRect(x: 0, y: 0, width: 150, height: 13)
        errorLabel.textColor = UIColor(red: 0.867, green: 0.173, blue: 0, alpha: 1)
        errorLabel.font = UIFont(name: "Inter-Medium", size: 11)
        // Line height: 13 pt
        errorLabel.text = "Password Invalid"
        view.addSubview(errorLabel)
        
    }
    func setUpTextFields(){
        
        
        fullnameField.frame = CGRect(x: 0, y: 0, width: 327, height: 53)
        fullnameField.layer.cornerRadius = 5
        fullnameField.layer.borderWidth = 1
        fullnameField.layer.borderColor = UIColor(red: 0.886, green: 0.902, blue: 0.918, alpha: 1).cgColor
        fullnameField.placeholder = "Full Name"
        fullnameField.setLeftPaddingPoints(18)
        fullnameField.autocapitalizationType = .none
        view.addSubview(fullnameField)
        
        emailField.frame = CGRect(x: 0, y: 0, width: 327, height: 53)
        emailField.layer.cornerRadius = 5
        emailField.layer.borderWidth = 1
        emailField.layer.borderColor = UIColor(red: 0.886, green: 0.902, blue: 0.918, alpha: 1).cgColor
        emailField.placeholder = "Email Address"
        emailField.autocapitalizationType = .none
        
        emailField.setLeftPaddingPoints(18)
        view.addSubview(emailField)
        
        passwordField.frame = CGRect(x: 0, y: 0, width: 327, height: 53)
        passwordField.layer.cornerRadius = 5
        passwordField.layer.borderWidth = 1
        passwordField.layer.borderColor = UIColor(red: 0.886, green: 0.902, blue: 0.918, alpha: 1).cgColor
        passwordField.placeholder = "Password"
        passwordField.setLeftPaddingPoints(18)
        passwordField.isSecureTextEntry = true
        view.addSubview(passwordField)
        
    }
    func setUpButtons(){
        
        forgotButton.frame = CGRect(x: 0, y: 0, width: 121, height: 17)
        forgotButton.titleLabel?.font = UIFont(name: "Inter-Medium", size: 14) ?? UIFont.systemFont(ofSize: 14)
        // Line height: 17 pt
        // (identical to box height)
        forgotButton.setTitle("Forgot Password?", for: .normal)
        forgotButton.setTitleColor(.black, for: .normal)
        forgotButton.addTarget(self, action: #selector(forgotButtonTapped), for: .touchUpInside)
        view.addSubview(forgotButton)
        
        signUpButton.frame = CGRect(x: 0, y: 0, width: 327, height: 63)
        signUpButton.backgroundColor = UIColor(red: 0.863, green: 0.863, blue: 1, alpha: 1)
        signUpButton.layer.cornerRadius = 5
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(UIColor(red: 0.545, green: 0.549, blue: 1, alpha: 1), for: .normal)
        signUpButton.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 16)
        signUpButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        view.addSubview(signUpButton)
        
        signInButton.frame = CGRect(x: 0, y: 0, width: 90, height: 18)
        signInButton.setTitleColor(UIColor(red: 0.55, green: 0.55, blue: 1, alpha: 1), for: .normal)
        signInButton.titleLabel?.font = UIFont(name: "Inter-Medium", size: 15)
        // Line height: 18 pt
        signInButton.setTitle("Sign in now", for: .normal)
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        view.addSubview(signInButton)
        
    }
    
    func applyConstraints(){
        forgotButtonTopConstraint = forgotButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 12)
        forgotButtonTopConstraint.isActive = true
        signUpLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        fullnameField.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        forgotButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        alreadyLabel.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorIcon.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            signUpLabel.widthAnchor.constraint(equalToConstant: 327),
            signUpLabel.heightAnchor.constraint(equalToConstant: 31),
            signUpLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 96),
            signUpLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            signUpLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            
            subtitleLabel.widthAnchor.constraint(equalToConstant: 327),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 18),
            subtitleLabel.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 16),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            fullnameField.widthAnchor.constraint(equalToConstant: 327),
            fullnameField.heightAnchor.constraint(equalToConstant: 53),
            fullnameField.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 40),
            fullnameField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 24),
            fullnameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
        
            emailField.widthAnchor.constraint(equalToConstant: 327),
            emailField.heightAnchor.constraint(equalToConstant: 53),
            emailField.topAnchor.constraint(equalTo: fullnameField.bottomAnchor, constant: 16),
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            passwordField.widthAnchor.constraint(equalToConstant: 327),
            passwordField.heightAnchor.constraint(equalToConstant: 53),
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 16),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            forgotButton.widthAnchor.constraint(equalToConstant: 121),
            forgotButton.heightAnchor.constraint(equalToConstant: 17),
            
            forgotButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 230),
            forgotButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            
            signUpButton.widthAnchor.constraint(equalToConstant: 327),
            signUpButton.heightAnchor.constraint(equalToConstant: 63),
            signUpButton.topAnchor.constraint(equalTo: forgotButton.bottomAnchor, constant: 24),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            alreadyLabel.widthAnchor.constraint(equalToConstant: 200),
            alreadyLabel.heightAnchor.constraint(equalToConstant: 18),
            alreadyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 53),
            
            alreadyLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35),
            
            signInButton.widthAnchor.constraint(equalToConstant: 90),
            signInButton.heightAnchor.constraint(equalToConstant: 18),
            signInButton.leadingAnchor.constraint(equalTo: alreadyLabel.trailingAnchor, constant: 0),
            signInButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35),
            
            errorIcon.widthAnchor.constraint(equalToConstant: 16),
            errorIcon.heightAnchor.constraint(equalToConstant: 16),
            errorIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            errorIcon.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 9),
            
            errorLabel.widthAnchor.constraint(equalToConstant: 350),
            errorLabel.heightAnchor.constraint(equalToConstant: 18),
            errorLabel.leadingAnchor.constraint(equalTo: errorIcon.trailingAnchor, constant: 5),
            errorLabel.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 8)
            
            
            
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
     private func saveAccessToken(_ accessToken: String) {
         print(accessToken)
            
         
         }
     private func navigateToMain() {
         DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                 let homeVC = HomeViewController()
                 self.navigationController?.navigationBar.isHidden = true
                 self.navigationController?.pushViewController(homeVC, animated: true)
             }
         
         }
     
     @objc func forgotButtonTapped() {
             // Forgot button tapped
         }
         
     @objc func registerButtonTapped() {
         let fullName = fullnameField.text ?? ""
         let email = emailField.text ?? ""
         let password = passwordField.text ?? ""
         
         let validationResult = InputValidator.validateInputs(fullName: fullName, email: email, password: password)
         
         switch validationResult {
         case .success:
             let user = User(fullName: fullName, email: email, password: password)
             
             registerViewModel.registerUser(user: user) { [weak self] result in
                 DispatchQueue.main.async {
                     switch result {
                     case .success(let accessToken):
                         self?.saveAccessToken(accessToken)
                         self?.changeColorSuccess()
                         self?.errorLabel.isHidden = true
                         self?.errorIcon.isHidden = true
                         self?.moveForgotButton()
                         self?.navigateToMain()
                     case .failure(let error):
                         self?.showError(message: error.localizedDescription, field: self?.passwordField)
                         self?.moveForgotButton()
                     }
                 }
             }
         case .failure(let message):
             showError(message: message, field: nil)
         }
     }
         
    @objc func signInButtonTapped() {
             let signInVC = SignInViewController()
             self.navigationController?.navigationBar.isHidden = true
             self.navigationController?.pushViewController(signInVC, animated: true)
             
    }
     func moveForgotButton() {
         if errorLabel.isHidden {
             forgotButtonTopConstraint.constant = 12
         } else {
             forgotButtonTopConstraint.constant = 48
         }
         UIView.animate(withDuration: 0.3) {
             self.view.layoutIfNeeded()
         }
     }
     func changeColorSuccess(){
         signUpButton.backgroundColor = UIColor(red: 0.55, green: 0.55, blue: 1, alpha: 1)
         signUpButton.titleLabel?.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
     }

}

