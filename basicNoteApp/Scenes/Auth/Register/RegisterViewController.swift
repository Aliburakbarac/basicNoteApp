//
//  RegisterViewController.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 12.07.2023.
//

import UIKit

 final class RegisterViewController: BaseViewController {
     private let signUpLabel: UILabel = {
         
         let label = UILabel()
         label.frame = CGRect(x: 0, y: 0, width: 327, height: 31)
         label.textColor = .appBlack
         label.font = .title1()
         label.textAlignment = .center
         label.text = "Sign Up"
         return label
         
     }()
     private lazy var fullnameField: AuthReusableTextfield = {
         
         let textField = AuthReusableTextfield()
         textField.setPlaceholder("Full Name")
         textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
         return textField }()
     
     private let subtitleLabel: UILabel = {
        let label = UILabel()
         label.frame = CGRect(x: 0, y: 0, width: 327, height: 18)
         label.textColor = .appGray
         label.font = .title3()
         label.textAlignment = .center
         label.text = "Login or sign up to continue using our app."
         return label
     }()
     private lazy var emailField: AuthReusableTextfield = {
         
         let textField = AuthReusableTextfield()
         textField.setPlaceholder("Email Adress")
         textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
         return textField
     }()
     private lazy var passwordField: AuthReusableTextfield = {
         
         let textField = AuthReusableTextfield()
         textField.setPlaceholder("Password")
         textField.isSecureTextEntry = true
         textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
         return textField
         
     }()
     private lazy var forgotButton: UIButton = {
         
        let button = UIButton()
         button.frame = CGRect(x: 0, y: 0, width: 121, height: 17)
         button.titleLabel?.font = .title4()
         button.setTitle("Forgot Password?", for: .normal)
         button.setTitleColor(.appBlack, for: .normal)
         button.addTarget(self, action: #selector(forgotButtonTapped), for: .touchUpInside)
         return button
         
     }()
     private let buttonStackView:  ReusableButtonStackView = {
         let loginButton = ReusableButtonStackView()
         loginButton.setButtonTitle("Sign Up")
         return loginButton
     }()
     private let alreadyLabel: UILabel = {
         
         let label = UILabel()
         label.frame = CGRect(x: 0, y: 0, width: 200, height: 18)
         label.textColor = .appGray
         label.font = .title3()
         label.text = "Already have an account?"
         return label
         
     }()
     private lazy var signInButton: UIButton = {
        
         let button = UIButton()
         button.frame = CGRect(x: 0, y: 0, width: 90, height: 18)
         button.setTitleColor(.appPurple, for: .normal)
         button.titleLabel?.font = .title3()
         button.setTitle("Sign in now", for: .normal)
         button.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
         return button
         
     }()
     private let errorLabel: UILabel = {
         
         let label = UILabel()
         label.frame = CGRect(x: 0, y: 0, width: 150, height: 13)
         label.textColor = .appRed
         label.font = .title5()
         label.text = "Password Invalid"
         return label
         
     }()
     private let errorIcon: UIImageView = {
         
        let imageView = UIImageView()
         imageView.frame = CGRect(x: 0, y: 0, width: 16, height: 16)
         imageView.image = UIImage(named: "ic_error")
         return imageView
         
     }()
    private var forgotButtonTopConstraint: NSLayoutConstraint!
    private let validation = InputValidator()
    
     var service = NetworkManager()
     var accessToken = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        applyConstraints()
        registerClicked()
    
        errorIcon.isHidden = true
        errorLabel.isHidden = true

        // Do any additional setup after loading the view.
    }
     override func viewDidAppear(_ animated: Bool) {
         navigationController?.navigationBar.isHidden = true
     }
     func setUpViews(){
        view.addSubview(buttonStackView)
        view.addSubview(fullnameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(signUpLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(alreadyLabel)
        view.addSubview(errorLabel)
         view.addSubview(errorIcon)
         view.addSubview(forgotButton)
         view.addSubview(signInButton)
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
                         self.errorLabel.isHidden = true
                         self.errorIcon.isHidden = true
                         self.moveForgotButton()
                         self.navigateToMain()
                         
                         print(response)
                         
                     case .failure(let error):
                         
                         if let errorResponse = error as? ErrorResponse {
                             ToastPresenter.showWarningToast(text: errorResponse.message)
                             
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
            signInButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            
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

         field?.layer.borderColor = UIColor.appRed.cgColor
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
             self.navigationController?.pushViewController(homeVC, animated: true)
             }
         
         }
     
     @objc func forgotButtonTapped() {
         let forgotVC = ForgotPasswordViewController()
         navigationController?.pushViewController(forgotVC, animated: true)
         }
         
    @objc func signInButtonTapped() {
             let signInVC = SignInViewController()
             self.navigationController?.pushViewController(signInVC, animated: true)
        
            
             
    }
     public func checkTextFields() {
             if let text1 = fullnameField.text, !text1.isEmpty,
                let text2 = emailField.text, !text2.isEmpty,
                let text3 = passwordField.text, !text3.isEmpty {
                 
                 buttonStackView.isEnabled()
             } else {
                
             }
         }
     @objc func textFieldDidChange(_ textField: UITextField) {
             checkTextFields()
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
     

}

