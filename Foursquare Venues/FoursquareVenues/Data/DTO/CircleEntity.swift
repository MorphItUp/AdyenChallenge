//
//  CircleEntity.swift
//  Foursquare Venues
//
//  Created by Mohamed El Gedawy on 16/08/2022.
//

import Foundation

// MARK: - CircleEntity

class Circle: Codable {
    let center: CenterEntity
    let radius: Int

    init(center: CenterEntity = CenterEntity(), radius: Int = 0) {
        self.center = center
        self.radius = radius
    }

}
