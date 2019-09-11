//
//  MovieDataModel.swift
//  movieDatabase
//
//  Created by Michael Kozub on 9/10/19.
//  Copyright © 2019 Michael Kozub. All rights reserved.
//

import Foundation

struct ApiResponse: Codable {
    let success: Bool?
    let message: String?
    let results: [MovieDataModel]
}

class MovieDataModel: NSObject, Codable {
    var id: Int?
    var title: String?
    var imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case imageUrl = "poster_path"
    }
}
