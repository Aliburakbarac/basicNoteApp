//
//  RegisterViewModel.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 12.07.2023.
//

import Foundation

class RegisterViewModel {
    private let registerAPI: RegisterAPI
    
    init(registerAPI: RegisterAPI) {
        self.registerAPI = registerAPI
    }
    
    func registerUser(user: User, completion: @escaping (Result<String, Error>) -> Void) {
        
        registerAPI.registerUser(user: user) { result in
            switch result {
            case .success(let accessToken):
                
                
                completion(.success(accessToken))
               
                print(accessToken)
            case .failure(let error):
           
                completion(.failure(error))
            }
        }
    }
    
}
