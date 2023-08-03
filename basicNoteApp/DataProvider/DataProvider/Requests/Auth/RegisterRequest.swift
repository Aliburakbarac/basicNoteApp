//
//  RegisterRequest.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 2.08.2023.
//

import Foundation

struct RegisterRequest: RequestProtocol {
    
    typealias ResponseType = BaseResponse<Auth>

    var path: String = "auth/register"
    var method: RequestMethod = .post
    var parameters: RequestParameters = [:]
    
    init(fullName: String, email: String, password: String) {
        parameters["full_name"] = fullName
        parameters["email"] = email
        parameters["password"] = password
    }
}
