//
//  RequestProtocol.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 2.08.2023.
//

import Foundation

typealias RequestParameters = [String: Any]
typealias RequestHeaders = [String: String]

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum RequestEncoding {
    case url
    case json
}

protocol RequestProtocol {
    associatedtype ResponseType: Decodable
    
    var url: String { get }
    var path: String { get }
    var headers: RequestHeaders { get }
    var method: RequestMethod { get }
    var parameters: RequestParameters { get }
    var encoding: RequestEncoding { get }
}

extension RequestProtocol {
    var url: String {
        return "https://basicnoteapp.mobillium.com/api/" + path
    }
    
    var parameters: RequestParameters {
        return [:]
    }
    
    var headers: RequestHeaders {
        return [:]
    }
    
    var encoding: RequestEncoding {
        switch method {
        case .get:
            return .url
        default:
            return .json
        }
    }
}
