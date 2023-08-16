//
//  SignInViewController.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 14.07.2023.
//

import UIKit

final class SignInViewController: BaseViewController {
    
    private let loginLabel: UILabel = {
        let label  = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 327, height: 31)
        label.textColor = .appBlack
        label.font = .title1()
        label.textAlignment = .center
        label.text = "Login"
        return label
    }()
    private let loginSubLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 327, height: 18)
        label.textColor = .appGray
        label.font = .title3()
        label.textAlignment = .center
        label.text = "Login or sign up to continue using our app."
        return label
    }()
    private lazy var signEmailField: AuthReusableTextfield = {
        let textField = AuthReusableTextfield()
        textField.setPlaceholder("Email Adress")
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return textField
    }()
    private lazy var signPasswordField: AuthReusableTextfield = {
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
    private let signInButtonStackView: ReusableButtonStackView = {
        let button = ReusableButtonStackView()
        button.setButtonTitle("Sign In")
        return button
    }()
    private let alreadyLabel:UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 81, height: 18)
        label.textColor = .appGray
        label.font = .title3()
        label.text = "New user?"
        return label
    }()
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 87, height: 18)
        button.setTitleColor(.appPurple, for: .normal)
        button.titleLabel?.font = .title3()
        button.setTitle("Sign up now", for: .normal)
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        return button
    }()
    private let errorIcon: UIImageView = {
       
        let errorIcon = UIImageView()
        errorIcon.frame = CGRect(x: 0, y: 0, width: 327, height: 82)
        errorIcon.image = UIImage(named: "ic_error")
        errorIcon.contentMode = UIView.ContentMode.scaleAspectFit
        return errorIcon
    }()
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 89, height: 13)
        label.textColor = .appRed
        label.font = .title5()
        label.text = "Password Invalid"
        return label
    }()
    private var forgotButtonTopConstraint: NSLayoutConstraint!
    private let validation = InputValidator()
    private var isButtonTapped = false

    var service = NetworkManager()
    var accessToken = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        checkTextFields()
        setUpViews()
        setUpConstraints()
        loginButtonTapped()
       
        errorIcon.isHidden = true
        errorLabel.isHidden = true
        
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    func setUpViews(){
        view.addSubview(loginLabel)
        view.addSubview(loginSubLabel)
        view.addSubview(alreadyLabel)
        view.addSubview(forgotButton)
        view.addSubview(signUpButton)
        view.addSubview(signInButtonStackView)
        view.addSubview(signEmailField)
        view.addSubview(signPasswordField)
        view.addSubview(errorLabel)
        view.addSubview(errorIcon)
        view.addSubview(signInButtonStackView)
    }
    private func setUpConstraints(){
        forgotButtonTopConstraint = forgotButton.topAnchor.constraint(equalTo: signPasswordField.bottomAnchor, constant: 12)
        forgotButtonTopConstraint.isActive = true
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginSubLabel.translatesAutoresizingMaskIntoConstraints = false
        signEmailField.translatesAutoresizingMaskIntoConstraints = false
        signPasswordField.translatesAutoresizingMaskIntoConstraints = false
        forgotButton.translatesAutoresizingMaskIntoConstraints = false
        signInButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        alreadyLabel.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        errorIcon.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                                    
            loginLabel.widthAnchor.constraint(equalToConstant: 327),
            loginLabel.heightAnchor.constraint(equalToConstant: 31),
            loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 96),
            loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 152.5),
            loginLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -152.5),
            
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
            
            signInButtonStackView.widthAnchor.constraint(equalToConstant: 327),
            signInButtonStackView.heightAnchor.constraint(equalToConstant: 63),
            signInButtonStackView.topAnchor.constraint(equalTo: forgotButton.bottomAnchor, constant: 24),
            signInButtonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            signInButtonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            alreadyLabel.widthAnchor.constraint(equalToConstant: 81),
            alreadyLabel.heightAnchor.constraint(equalToConstant: 18),
            alreadyLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35),
            alreadyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 113),
            
            signUpButton.widthAnchor.constraint(equalToConstant: 94),
            signUpButton.heightAnchor.constraint(equalToConstant: 18),
            signUpButton.leadingAnchor.constraint(equalTo: alreadyLabel.trailingAnchor, constant: 0),
            signUpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35),
            
            errorIcon.widthAnchor.constraint(equalToConstant: 16),
            errorIcon.heightAnchor.constraint(equalToConstant: 16),
            errorIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            errorIcon.topAnchor.constraint(equalTo: signPasswordField.bottomAnchor, constant: 9),
            
            errorLabel.widthAnchor.constraint(equalToConstant: 350),
            errorLabel.heightAnchor.constraint(equalToConstant: 18),
            errorLabel.leadingAnchor.constraint(equalTo: errorIcon.trailingAnchor, constant: 5),
            errorLabel.topAnchor.constraint(equalTo: signPasswordField.bottomAnchor, constant: 8)
            
                                    ])
        
        
    }
    func showError(message: String, field: UITextField?) {
       
        field?.layer.borderColor = UIColor.appRed.cgColor
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

            let forgotVC = ForgotPasswordViewController()
            navigationController?.pushViewController(forgotVC, animated: true)
                
    }
    private func loginButtonTapped(){
        signInButtonStackView.buttonTappedHandler = {
            let email = self.signEmailField.text ?? ""
            let password = self.signPasswordField.text ?? ""
            
            let validationResult = InputValidator.validateInputs(fullName: "nsdsdsdil", email: email, password: password)
            
            switch validationResult {
            case .success:
                let loginRequest = LoginRequest(email: email, password: password)
                self.service.requestWithAlamofire(for: loginRequest) { [weak self] result in
                    guard let self = self else { return }
                    switch result {
                    case .success(let response):
                        accessToken = response.data?.accessToken ?? ""

                       
                            errorLabel.text = response.message
                            errorLabel.isHidden = true
                            errorIcon.isHidden = true
                            moveForgotButton()
                            navigateToMain()
                        
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
                
                
                if message == ValidationConstant.emailRequired || message == ValidationConstant.invalidEmail {
                    invalidField = self.signEmailField
                } else if message == ValidationConstant.passwordRequired || message == ValidationConstant.invalidPassword {
                    invalidField = self.signPasswordField
                } else {
                    invalidField = nil
                }
                
                self.showError(message: message, field: invalidField)
            
        }
        }
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
    private func navigateToMain() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                let homeVC = HomeViewController()
                self.navigationController?.pushViewController(homeVC, animated: true)
            }
        
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
    public func checkTextFields() {
            if let text2 = signEmailField.text, !text2.isEmpty,
               let text3 = signPasswordField.text, !text3.isEmpty {
                
                signInButtonStackView.isEnabled()
            } else {
               
            }
        }
    @objc func textFieldDidChange(_ textField: UITextField) {
            checkTextFields()
        }
}
