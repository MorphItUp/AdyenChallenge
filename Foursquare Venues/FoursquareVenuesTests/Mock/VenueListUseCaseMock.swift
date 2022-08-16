//
//  VenueListUseCaseMock.swift
//  Foursquare VenuesTests
//
//  Created by Mohamed El Gedawy on 16/08/2022.
//

import Foundation
import Combine
@testable import FoursquareVenues

class VenueListUseCaseMock: VenuesListUseCaseProtocol {
    
    // MARK: - Properties
    
    var error: Error?
    var model: [VenuesModel]?
    var venueListReturnValue: Future<[VenuesModel]?, Error> {
        Future<[VenuesModel]?, Error>.init { promise in
            if let error = self.error {
                promise(.failure(error))
            } else if let model = self.model {
                promise(.success(model))
            }
        }
    }
    
    // MARK: - Methods
    
    func execute(radius: Int) -> AnyPublisher<[VenuesModel]?, Error> {
        return venueListReturnValue.eraseToAnyPublisher()
    }
}
