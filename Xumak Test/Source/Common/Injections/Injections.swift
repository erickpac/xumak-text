//
//  Injections.swift
//  Xumak Test
//
//  Created by Erick Pac on 27/01/21.
//

import Foundation

enum APIConstants: String {
    case BASE_URL = "http://de-coding-test.s3.amazonaws.com/"
    
    var value: String {
        return self.rawValue
    }
}

class Injections {
    
    static let shared: Injections = Injections()
    let apiManager: APIManager = APIManager(baseURL: APIConstants.BASE_URL.value)
    
}
