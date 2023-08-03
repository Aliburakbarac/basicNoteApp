//
//  ErrorResponse.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 2.08.2023.
//

import Foundation

struct ErrorResponse: Decodable,Error {
    let code: String
    let message: String
}
