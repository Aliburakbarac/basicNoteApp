//
//  APIManager.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 18.07.2023.
//

import Foundation

class APIManager {
    func apiManager(requestModel: Encodable, path: String, method: RequestMethod, completion: @escaping (Result<Decodable, Error>) -> Void) {
        let urlString = "https://basicnoteapp.mobillium.com/api/"
        
        guard let url = URL(string: urlString + path) else {
            
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //request.setValue("Bearer", forHTTPHeaderField: "Authorization")
        
        do {
            request.httpBody = try JSONEncoder().encode(requestModel)
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {

                    return
                }
                
                guard let data = data else {
                    
                    return
                }
                
                do {
                    
                    let decoder = JSONDecoder()
                    let response = try? decoder.decode(BaseResponseModel<AuthResponseModel>.self, from: data)
                    completion(.success(response))
                   
                    
                }
            }
            
            task.resume()
        } catch {
            completion(.failure(error))
        }
    }
}


