//
//  InputValidator.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 14.07.2023.
//


import Foundation

class InputValidator {
    static func isValidFullName(_ fullName: String) -> Bool {
        return !fullName.isEmpty && fullName.count <= 255
    }
    
    static func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    static func isValidPassword(_ password: String) -> Bool {
        return password.count >= 6
    }
    
    static func validateInputs(fullName: String, email: String, password: String) -> ValidationResult {
        if fullName.isEmpty {
            return .failure(message: ValidationConstant.fullNameRequired)
        }
        
        if fullName.count > 255 {
            return .failure(message: ValidationConstant.fullNameMaxLength)
        }
        
        if email.isEmpty {
            return .failure(message: ValidationConstant.emailRequired)
        }
        
        if !isValidEmail(email) {
            return .failure(message: ValidationConstant.invalidEmail)
        }
        
        if password.isEmpty {
            return .failure(message: ValidationConstant.passwordRequired)
        }
        
        if !isValidPassword(password) {
            return .failure(message: ValidationConstant.invalidPassword)
        }
        
        return .success
    }
}

enum ValidationResult {
    case success
    case failure(message: String)
}
enum ValidationError: Error {
    case fullNameInvalid
    case emailInvalid
    case passwordInvalid
    
    var localizedDescription: String {
        switch self {
        case .fullNameInvalid:
            return "Invalid full name"
        case .emailInvalid:
            return "Invalid email address"
        case .passwordInvalid:
            return "Invalid password"
        }
    }
}

