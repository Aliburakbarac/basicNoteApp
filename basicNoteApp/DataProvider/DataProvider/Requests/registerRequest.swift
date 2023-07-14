//
//  registerRequest.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 13.07.2023.
//

import Foundation

class RegisterAPI {
    func registerUser(user: User, completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: "https://basicnoteapp.mobillium.com/api/auth/register") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do {
            let jsonData = try JSONEncoder().encode(user)
            request.httpBody = jsonData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(NetworkError.invalidData))
                    return
                }
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    let accessToken = json?["access_token"] as? String ?? ""
                    completion(.success(accessToken))
                } catch {
                    completion(.failure(error))
                }
            }
            
            task.resume()
        } catch {
            completion(.failure(error))
        }
    }
}

enum NetworkError: Error {
    case invalidURL
    case invalidData
}
