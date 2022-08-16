//
//  VenueListViewModel.swift
//  Foursquare Venues
//
//  Created by Mohamed El Gedawy on 14/08/2022.
//

import Foundation
import Combine
import AdyenNetworking

class VenueListViewModel: ObservableObject {
    
    // MARK: - Private Properties
    
    private var bag = Set<AnyCancellable>()
    private let venuesListUseCase: VenuesListUseCaseProtocol
    
    let errorMessageSubject = CurrentValueSubject<String, Never>("Unknown error occured")
    let errorSubject = PassthroughSubject<Void, Never>()
    @Published var venues: [VenuesModel] = []
    
    // MARK: - Init
    
    init(venuesListUseCase: VenuesListUseCaseProtocol) {
        self.venuesListUseCase = venuesListUseCase
        self.requestVenuesList(radius: 1000)
    }
    
    // MARK: - Methods
    
    func requestVenuesList(radius: Int) {
        venuesListUseCase.execute(radius: radius)
            .sink { [weak self] error in
                guard let self = self else { return }
                switch error {
                case .finished:
                    break
                case .failure:
                    self.errorSubject.send()
                    self.errorMessageSubject.send("Unknown error occured")
                }
            } receiveValue: { [weak self] venues in
                guard let self = self, let model = venues else { return }
                self.venues = model
            }
            .store(in: &bag)
    }
    
}
