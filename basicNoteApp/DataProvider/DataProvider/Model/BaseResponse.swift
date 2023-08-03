//
//  BaseResponse.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 26.07.2023.
//

import Foundation

struct BaseResponse<T: Decodable>: Decodable {
    let data: T?
    let code: String?
    let message: String?
    
    
}
