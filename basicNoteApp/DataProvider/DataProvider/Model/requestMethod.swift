//
//  requestMethod.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 18.07.2023.
//

import Foundation

public enum RequestMethod: String {
    case connect = "CONNECT"
    case delete = "DELETE"
    case get = "GET"
    case head = "HEAD"
    case options = "OPTIONS"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
    case trace = "TRACE"
}
