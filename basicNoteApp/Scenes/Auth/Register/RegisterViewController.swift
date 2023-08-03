//
//  RegisterViewController.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 12.07.2023.
//

import UIKit

 final class RegisterViewController: BaseViewController, UITextFieldDelegate {
    private let signUpLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let fullnameField = AuthReusableTextfield()
    private let emailField = AuthReusableTextfield()
    private let passwordField = AuthReusableTextfield()
    private let forgotButton = UIButton()
    private let buttonStackView =  ReusableButtonStackView()
    private let alreadyLabel = UILabel()
    private let signInButton = UIButton()
    private let errorLabel = UILabel()
    private let errorIcon = UIImageView()
    private var forgotButtonTopConstraint: NSLayoutConstraint!
    private let validation = InputValidator()
    
     var service = NetworkManager()
     var accessToken = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullnameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        setUpLabel()
        setUpTextFields()
        setUpViews()
        setUpButtons()
        setUpImages()
        applyConstraints()
        registerClicked()
        
        errorIcon.isHidden = true
        errorLabel.isHidden = true
        
        
        
        
        
        
      
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
        signUpLabel.textAlignment = .center
        signUpLabel.text = "Sign Up"
        view.addSubview(signUpLabel)
        
        subtitleLabel.frame = CGRect(x: 0, y: 0, width: 327, height: 18)
        subtitleLabel.textColor = UIColor(red: 0.514, green: 0.552, blue: 0.571, alpha: 1)
        subtitleLabel.font = UIFont(name: "Inter-Medium", size: 15)
        subtitleLabel.textAlignment = .center
        subtitleLabel.text = "Login or sign up to continue using our app."
        view.addSubview(subtitleLabel)
        
        alreadyLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 18)
        alreadyLabel.textColor = UIColor(red: 0.51, green: 0.55, blue: 0.57, alpha: 1)
        alreadyLabel.font = UIFont(name: "Inter-Medium", size: 15)
        alreadyLabel.text = "Already have an account?"
        view.addSubview(alreadyLabel)
        
        errorLabel.frame = CGRect(x: 0, y: 0, width: 150, height: 13)
        errorLabel.textColor = UIColor(red: 0.867, green: 0.173, blue: 0, alpha: 1)
        errorLabel.font = UIFont(name: "Inter-Medium", size: 11)
        errorLabel.text = "Password Invalid"
        view.addSubview(errorLabel)
        
    }
     func setUpViews(){
        buttonStackView.setButtonTitle("Sign Up")
        view.addSubview(buttonStackView)
         
         
         
     }
     func registerClicked(){
         buttonStackView.buttonTappedHandler = {
             let fullName = self.fullnameField.text ?? ""
             let email = self.emailField.text ?? ""
             let password = self.passwordField.text ?? ""
             
             let validationResult = InputValidator.validateInputs(fullName: fullName, email: email, password: password)
             
             switch validationResult {
             case .success:
                 let registerRequest = RegisterRequest(fullName: fullName, email: email, password: password)
                 self.service.requestWithAlamofire(for: registerRequest) { [weak self] result in
                     guard let self = self else { return }
                     switch result {
                     case .success(let response):
                         self.accessToken = response.data?.accessToken ?? ""

                        
                             self.errorLabel.text = response.message
                             print(response)
                             print(response.code)
                             self.changeColorSuccess()
                             
                             self.errorLabel.isHidden = true
                             self.errorIcon.isHidden = true
                             self.moveForgotButton()
                             self.navigateToMain() 
                         
                         print(response)
                                  
                     case .failure(let error):
                         
                         if let errorResponse = error as? ErrorResponse {
                                             print("Error Code: \(errorResponse.code)")
                                             print("Error Message: \(errorResponse.message)")
                             self.showError(message: errorResponse.message, field: self.fullnameField)
                                            
                                         } else {
                                             print("General Error: \(error.localizedDescription)")
                                             
                                            
                                         }
                     }
                 }
             case .failure(let message):
                 let invalidField: UITextField?
                 
                 if message == ValidationConstant.fullNameRequired || message == ValidationConstant.fullNameMaxLength {
                     invalidField = self.fullnameField
                 } else if message == ValidationConstant.emailRequired || message == ValidationConstant.invalidEmail {
                     invalidField = self.emailField
                 } else if message == ValidationConstant.passwordRequired || message == ValidationConstant.invalidPassword {
                     invalidField = self.passwordField
                 } else {
                     invalidField = nil
                 }
                 
                 self.showError(message: message, field: invalidField)
             }
         }
     }
    func setUpTextFields(){
        
        fullnameField.setPlaceholder("Full Name")
        emailField.setPlaceholder("Email Adress")
        passwordField.setPlaceholder("Password")
        passwordField.isSecureTextEntry = true
        
        view.addSubview(fullnameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        
    }
    func setUpButtons(){
        
        forgotButton.frame = CGRect(x: 0, y: 0, width: 121, height: 17)
        forgotButton.titleLabel?.font = UIFont(name: "Inter-Medium", size: 14) ?? UIFont.systemFont(ofSize: 14)
        forgotButton.setTitle("Forgot Password?", for: .normal)
        forgotButton.setTitleColor(.black, for: .normal)
        forgotButton.addTarget(self, action: #selector(forgotButtonTapped), for: .touchUpInside)
        view.addSubview(forgotButton)
        
       
        
        signInButton.frame = CGRect(x: 0, y: 0, width: 90, height: 18)
        signInButton.setTitleColor(UIColor(red: 0.55, green: 0.55, blue: 1, alpha: 1), for: .normal)
        signInButton.titleLabel?.font = UIFont(name: "Inter-Medium", size: 15)
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
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
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
            
            
            buttonStackView.widthAnchor.constraint(equalToConstant: 327),
            buttonStackView.heightAnchor.constraint(equalToConstant: 63),
            buttonStackView.topAnchor.constraint(equalTo: forgotButton.bottomAnchor, constant: 24),
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
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
         
         if !errorLabel.isHidden {
             forgotButtonTopConstraint.constant = 48
         } else {
             forgotButtonTopConstraint.constant = 12
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
         let forgotVC = ForgotPasswordViewController()
         navigationController?.pushViewController(forgotVC, animated: true)
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
         buttonStackView.setButtonColor()
     }

}

