//
//  GeoBoundsEntity.swift
//  Foursquare Venues
//
//  Created by Mohamed El Gedawy on 16/08/2022.
//

import Foundation

// MARK: - GeoBoundsEntity

class GeoBounds: Codable {
    let circle: Circle

    init(circle: Circle = Circle()) {
        self.circle = circle
    }
}
