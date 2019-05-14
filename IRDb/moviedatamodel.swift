//
//  MovieDataModel.swift
//  IRDb
//
//  Created by Alec Smith on 3/20/19.
//  Copyright © 2019 Alec Smith. All rights reserved.
//

import UIKit

class MovieDataModel: Codable {
    var franchise: [franchise]

}

class franchise : Codable {
    let franchiseName: String
    let entries: [Entry]
}

class Entry : Codable {
    let name: String
    let format: String
    let yearStart: String
    let yearEnd: String?
    let episodes: Int?
    let studio: String?
    let network: String?
    let imageURL: String
    let description: String
    let summary: String
    let starring: [Cast]
}

class Cast: Codable {
    let name: String
    let playing: String
}
