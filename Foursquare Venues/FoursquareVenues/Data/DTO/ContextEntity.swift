//
//  ContextEntity.swift
//  Foursquare Venues
//
//  Created by Mohamed El Gedawy on 16/08/2022.
//

import Foundation

// MARK: - ContextEntity

class ContextEntity: Codable {
    let geoBounds: GeoBounds

    enum CodingKeys: String, CodingKey {
        case geoBounds = "geo_bounds"
    }

    init(geoBounds: GeoBounds = GeoBounds()) {
        self.geoBounds = geoBounds
    }
}
