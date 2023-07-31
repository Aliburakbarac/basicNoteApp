//
//  APIRequest.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 26.07.2023.
//

import Foundation

class APIRequest {
    func fetch<T: Decodable>(path: String, method: RequestMethod, completion: @escaping (Result<T, Error>) -> Void) {
        let urlString = "https://basicnoteapp.mobillium.com/api/"
        guard let url = URL(string: urlString + path) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        do {
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    
                    return
                }
                
                do {
                    var dataString = String(data: data, encoding: .utf8) ?? ""
                    print(dataString)
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(T.self, from: data)
                    completion(.success(response))
                } catch {
                    completion(.failure(error))
                }
            }
            
            task.resume()
        }
    }
    
    
    
}
