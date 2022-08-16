//
//  VenusListRepositoryTests.swift
//  FoursquareVenuesTests
//
//  Created by Mohamed El Gedawy on 16/08/2022.
//

import Foundation
import Combine
import XCTest
import AdyenNetworking

@testable import FoursquareVenues

class VenuesListRepositoryTests: XCTestCase {
    
    var sut: VenuesListRepositoryProtocol!
    var serviceMock: ServiceMock!
    var bag: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        serviceMock = ServiceMock()
        sut = VenuesListRepository(provider: serviceMock)
        bag = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        serviceMock = nil
        sut = nil
        bag = nil
        super.tearDown()
    }
    
    func test_getVenuesList_failure() {
        
        serviceMock.error = .unknown
        let expectation = expectation(description: "123")
        
        sut.getVenuesList(radius: 12).sink { error in
            switch error {
            case .finished:
                break
            case .failure(let error):
                expectation.fulfill()
                XCTAssertEqual(error as! ServiceError, ServiceError.unknown)
            }
        } receiveValue: { _ in }
            .store(in: &bag)
        
        wait(for: [expectation], timeout: 3)
    }
    
    func test_getVenuesList_Success() {
        serviceMock.model = VenuesEntity()
        let expectation = expectation(description: "123")
        
        sut.getVenuesList(radius: 12).sink { _ in
        } receiveValue: { response in
            expectation.fulfill()
            XCTAssertEqual(response?.count, 0)
        }.store(in: &bag)
        
        wait(for: [expectation], timeout: 3)
    }
    
    
}
