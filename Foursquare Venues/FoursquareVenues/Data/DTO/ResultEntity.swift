//
//  ResultEntity.swift
//  Foursquare Venues
//
//  Created by Mohamed El Gedawy on 16/08/2022.
//

import Foundation

// MARK: - ResultEntity

class ResultEntity: Codable {
    var id: String
    var distance: Int
    var name: String

    enum CodingKeys: String, CodingKey {
        case id = "fsq_id"
        case distance, name
    }
}
