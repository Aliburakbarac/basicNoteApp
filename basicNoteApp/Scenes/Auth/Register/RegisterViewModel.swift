//
//  RegisterViewModel.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 12.07.2023.
//

import Foundation

class RegisterViewModel {
    private let registerAPI: APIRequest
    
    init(registerAPI: APIRequest) {
        self.registerAPI = registerAPI
    }
    
    func registerUser(user: User, completion: @escaping (Result<BaseResponseModel<User>, Error>) -> Void) {
        registerAPI.fetch(path: "auth/register", method: RequestMethod.post, completion: completion)
    }
}

