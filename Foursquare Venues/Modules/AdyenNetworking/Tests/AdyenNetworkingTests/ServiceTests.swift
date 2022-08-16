//
//  ServiceTests.swift
//  FoursquareVenuesTests
//
//  Created by Mohamed El Gedawy on 16/08/2022.
//

import Foundation
import XCTest

@testable import AdyenNetworking

class ServiceTests: XCTestCase {
    
    var sut: Service!
    var urlSessionMock: URLSessionMock!
    
    override func setUp() {
        super.setUp()
        
        urlSessionMock = URLSessionMock()
        sut = Service(session: urlSessionMock)
    }
    
    override func tearDown() {
        sut = nil
        urlSessionMock = nil
        super.tearDown()
    }
    
    func test_makeRequest_backendFailure() {
        urlSessionMock.error = NSError(domain: "backend", code: 100)
        let request = VenueListRequestMock()
        let expectation = expectation(description: "makeRequest_backendFailure")
        
        sut.makeRequest(request: request) { result in
            switch result {
            case .failure(let error):
                expectation.fulfill()
                XCTAssertEqual(error, ServiceError.unknown)
            case .success:
                break
            }
        }
        wait(for: [expectation], timeout: 3)
    }
    
    func test_makeRequest_decodingError() {
        urlSessionMock.error = nil
        urlSessionMock.data = Data()
        let request = VenueListRequestMock()
        let expectation = expectation(description: "makeRequest_decodingError")
        
        sut.makeRequest(request: request) { result in
            switch result {
            case .failure(let error):
                expectation.fulfill()
                XCTAssertEqual(error, ServiceError.decoding)
            case .success:
                break
            }
        }
        wait(for: [expectation], timeout: 3)
    }
    
    func test_makeRequest_success() {
        let entityMock = EntityMock(name: "TestEntity")
        let dataMock = try? JSONEncoder().encode(entityMock)
        urlSessionMock.data = dataMock
        
        let request = VenueListRequestMock()
        let expectation = expectation(description: "makeRequest_success")
        
        sut.makeRequest(request: request) { result in
            switch result {
            case .failure:
                break
            case .success(let response):
                expectation.fulfill()
                XCTAssertEqual(response, entityMock)
            }
        }
        wait(for: [expectation], timeout: 3)
        
    }
    
}
