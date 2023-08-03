//
//  ForgotRequest.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 2.08.2023.
//

import Foundation

struct ForgotRequest: RequestProtocol {
    
    typealias ResponseType = BaseResponse<Auth>

    var path: String = "auth/forgot-password"
    var method: RequestMethod = .post
    var parameters: RequestParameters = [:]
    
    init(email: String) {
        parameters["email"] = email
    }
}
