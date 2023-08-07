//
//  ForgotPasswordViewController.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 31.07.2023.
//

import UIKit

final class ForgotPasswordViewController: BaseViewController,UITextFieldDelegate {
    
    private let forgotLabel = UILabel()
    private let forgotSubLabel = UILabel()
    private let emailField = AuthReusableTextfield()
    private let resetButton = ReusableButtonStackView()
    
    var service = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        setUpViews()
        applyConstraints()
        forgotClicked()
        emailField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        checkTextFields()
    }
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    func setUpViews(){
        
        forgotLabel.frame = CGRect(x: 0, y: 0, width: 327, height: 31)
        forgotLabel.textColor = UIColor(red: 0.137, green: 0.137, blue: 0.235, alpha: 1)
        forgotLabel.font = .boldSystemFont(ofSize: 26)
        forgotLabel.textAlignment = .center
        forgotLabel.text = "Forgot Password?"
        view.addSubview(forgotLabel)
        
        forgotSubLabel.frame = CGRect(x: 0, y: 0, width: 327, height: 36)
        forgotSubLabel.textColor = UIColor(red: 0.514, green: 0.552, blue: 0.571, alpha: 1)
        forgotSubLabel.font = UIFont.systemFont(ofSize: 15)
        forgotSubLabel.numberOfLines = 0
        forgotSubLabel.lineBreakMode = .byWordWrapping
        forgotSubLabel.textAlignment = .center
        forgotSubLabel.text = "Confirm your email and we’ll send the instructions."
        view.addSubview(forgotSubLabel)
        
        emailField.setPlaceholder("Email Adress")
        view.addSubview(emailField)
        
        resetButton.setButtonTitle("Reset Password")
        view.addSubview(resetButton)
        
    }
    func applyConstraints(){
        emailField.translatesAutoresizingMaskIntoConstraints = false
        forgotLabel.translatesAutoresizingMaskIntoConstraints = false
        forgotSubLabel.translatesAutoresizingMaskIntoConstraints = false
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            forgotLabel.widthAnchor.constraint(equalToConstant: 327),
            forgotLabel.heightAnchor.constraint(equalToConstant: 31),
            forgotLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 96),
            forgotLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            forgotLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            forgotSubLabel.widthAnchor.constraint(equalToConstant: 327),
            forgotSubLabel.heightAnchor.constraint(equalToConstant: 36),
            forgotSubLabel.topAnchor.constraint(equalTo: forgotLabel.bottomAnchor, constant: 16),
            forgotSubLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            forgotSubLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            emailField.widthAnchor.constraint(equalToConstant: 327),
            emailField.heightAnchor.constraint(equalToConstant: 53),
            emailField.topAnchor.constraint(equalTo: forgotSubLabel.bottomAnchor, constant: 40),
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            resetButton.widthAnchor.constraint(equalToConstant: 327),
            resetButton.heightAnchor.constraint(equalToConstant: 63),
            resetButton.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 24),
            resetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            resetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
        
        ])
        forgotSubLabel.sizeToFit()
        
    }
    private func forgotClicked(){
        resetButton.buttonTappedHandler = {
            let forgotRequest = ForgotRequest(email: self.emailField.text ?? "")
            self.service.requestWithAlamofire(for: forgotRequest) { [weak self] result in
                guard self != nil else { return }
                switch result {
                case .success(let response):

                    DispatchQueue.main.async {
                        ToastPresenter.showSuccessToast(text: response.message!)
                    }
                    print(response)

                case .failure(let error):
                    if let errorResponse = error as? ErrorResponse {
                        ToastPresenter.showWarningToast(text: errorResponse.message)
                                       
                                    } else {
                                        print("General Error: \(error.localizedDescription)")
                                        
                                       
                                    }
                }
            }
        
        }
    }
    public func checkTextFields() {
        if let  text2 = emailField.text, !text2.isEmpty {
            
                resetButton.isEnabled()
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
