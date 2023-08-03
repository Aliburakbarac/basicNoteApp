//
//  User.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 13.07.2023.
//

import Foundation

struct User: Decodable {
    let id: Int?
    let fullName: String?
    let email: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case email
    }
}
