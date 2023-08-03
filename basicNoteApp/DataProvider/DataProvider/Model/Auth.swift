//
//  AuthResponseModel.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 26.07.2023.
//

import Foundation

struct Auth: Decodable {
    
    let accessToken: String?
    let tokenType: String?

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"

    }
}

