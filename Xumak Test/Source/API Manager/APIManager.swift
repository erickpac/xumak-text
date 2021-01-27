//
//  APIManager.swift
//  Xumak Test
//
//  Created by Erick Pac on 27/01/21.
//

import Alamofire

class APIManager {
    
    private let baseURL: String
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    func performRequest<T: Codable>(to endpoint: String,
                                    success: @escaping (T?) -> Void,
                                    failure: @escaping (Error?) -> Void) {
        
        let finalPath: String = baseURL + endpoint
        guard let url = URL(string: finalPath) else {
            failure(nil)
            return
        }
        
        AF.request(url).validate().responseDecodable { (response: DataResponse<T, AFError>) in
            if let _ = response.error {
                failure(response.error)
            }
            
            if let value = response.value {
                success(value)
            }
        }
    }
}
