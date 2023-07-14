//
//  User.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 13.07.2023.
//

import Foundation

public struct User: Encodable {

    public let fullName:String
    public let email: String
    public let password: String
    
    enum CodingKeys: String, CodingKey {
       
        case fullName = "full_name"
        case email
        case password
    }
}
