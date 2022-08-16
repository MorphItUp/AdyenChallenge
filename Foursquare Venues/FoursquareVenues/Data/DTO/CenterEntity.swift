//
//  CenterEntity.swift
//  Foursquare Venues
//
//  Created by Mohamed El Gedawy on 16/08/2022.
//

import Foundation

// MARK: - CenterEntityEntity

class CenterEntity: Codable {
    let latitude, longitude: Double

    init(latitude: Double = 0, longitude: Double = 0) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
