//
//  VenuesListViewModelTests.swift
//  FoursquareVenuesTests
//
//  Created by Mohamed El Gedawy on 16/08/2022.
//

import Foundation
import XCTest
import Combine
@testable import FoursquareVenues

class VenueListViewModelTests: XCTestCase {
    
    var sut: VenueListViewModel!
    var venuesListUseCaseMock: VenueListUseCaseMock!
    var bag: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        venuesListUseCaseMock = VenueListUseCaseMock()
        bag = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        venuesListUseCaseMock = nil
        sut = nil
        bag = nil
        super.tearDown()
    }
    
    func test_requestVenuesList_failure() {
        let expectation = expectation(description: "requestVenuesList_failure")
        venuesListUseCaseMock.error = NSError(domain: "backend", code: 100)
        sut = VenueListViewModel(venuesListUseCase: venuesListUseCaseMock)
        sut.errorMessageSubject.sink { errorMessage in
            expectation.fulfill()
            XCTAssertEqual(errorMessage, "Unknown error occured")
        }.store(in: &bag)
        wait(for: [expectation], timeout: 5)
    }
    
    func test_requestVenuesList_success() {
        let expectation = expectation(description: "requestVenuesList_success")
        let model = [VenuesModel.init(id: "id", name: "name", distance: 0)]
        venuesListUseCaseMock.model = model
        sut = VenueListViewModel(venuesListUseCase: venuesListUseCaseMock)
        sut.$venues.sink { venues in
            expectation.fulfill()
            XCTAssertEqual(venues, model)
        }.store(in: &bag)
        wait(for: [expectation], timeout: 3)
    }
    
}
