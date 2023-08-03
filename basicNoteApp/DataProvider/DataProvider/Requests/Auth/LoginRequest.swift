//
//  LoginRequest.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 2.08.2023.
//

import Foundation

struct LoginRequest: RequestProtocol {
    
    typealias ResponseType = BaseResponse<Auth>

    var path: String = "auth/login"
    var method: RequestMethod = .post
    var parameters: RequestParameters = [:]
    
    init(email: String, password: String) {
        parameters["email"] = email
        parameters["password"] = password
    }
}

