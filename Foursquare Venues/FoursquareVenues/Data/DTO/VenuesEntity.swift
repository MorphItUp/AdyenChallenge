//
//  VenuesEntity.swift
//  Foursquare Venues
//
//  Created by Mohamed El Gedawy on 12/08/2022.
//

import Foundation


// MARK: - VenuesEntity

class VenuesEntity: Codable {
    let results: [ResultEntity]
    let context: ContextEntity
   
    init(results: [ResultEntity] = [], context: ContextEntity = .init()) {
        self.results = results
        self.context = context
    }
}
