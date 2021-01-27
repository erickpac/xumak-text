//
//  Book.swift
//  Xumak Test
//
//  Created by Erick Pac on 27/01/21.
//

struct Book: Codable {
    
    var title: String?
    var image: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case image = "imageURL"
    }
    
}
