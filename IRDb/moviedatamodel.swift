//
//  MovieDataModel.swift
//  IRDb
//
//  Created by Alec Smith on 3/20/19.
//  Copyright © 2019 Alec Smith. All rights reserved.
//

import UIKit

class MovieDataModel: Codable {
    var franchise: [Franchises]
    
}

class Franchises : Codable {
    let franchiseName: String
    let entries: [Entries]
}

class Entries : Codable {
    let name: String
    let format: String
    let yearStart: String
    let yearEnd: String?
    let episodes: Int?
    let studio: String?
    let image: URL
    // let description: String
    let summary: String
}
