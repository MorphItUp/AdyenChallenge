//
//  VenuesListRepository.swift
//  Foursquare Venues
//
//  Created by Mohamed El Gedawy on 13/08/2022.
//

import Foundation
import Combine
import AdyenNetworking

protocol VenuesListRepositoryProtocol {
    func getVenuesList(radius: Int) -> AnyPublisher<[VenuesModel]?, Error>
}

class VenuesListRepository: VenuesListRepositoryProtocol {
    
    // MARK: - Properties
    
    let provider: ServiceProtocol
        
    // MARK: - Init
    
    init(provider: ServiceProtocol = Service()) {
        self.provider = provider
    }
    
    // MARK: - Methods
    
    func getVenuesList(radius: Int) -> AnyPublisher<[VenuesModel]?, Error> {
        Future<[VenuesModel]?, Error> { promise in
            let request = VenueListRequest(radius: radius)
            self.provider.makeRequest(request: request) { result in
                switch result {
                case .success(let response):
                    let venuesModel = response.results.map { VenuesModel.init(id: $0.id, name: $0.name, distance: $0.distance) }
                    promise(.success(venuesModel))
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
        
    }
}
