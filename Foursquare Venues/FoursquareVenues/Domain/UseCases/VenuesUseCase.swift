//
//  VenuesUseCase.swift
//  Foursquare Venues
//
//  Created by Mohamed El Gedawy on 13/08/2022.
//

import Foundation
import Combine

// MARK: - Venues UseCase

protocol VenuesListUseCaseProtocol {
    func execute(radius: Int) -> AnyPublisher<[VenuesModel]?, Error>
}

final class VenuesListUseCase: VenuesListUseCaseProtocol {
    
    // MARK: - Private Properties
    
    private let venuesListRepo: VenuesListRepository
    
    // MARK: - Init
    
    init(venuesListRepo: VenuesListRepository) {
        self.venuesListRepo = venuesListRepo
    }
    
    // MARK: - Methods
    
    func execute(radius: Int) -> AnyPublisher<[VenuesModel]?, Error> {
        return venuesListRepo.getVenuesList(radius: radius)
    }
    
    
}
