//
//  VenueListRequestMock.swift
//  
//
//  Created by Mohamed El Gedawy on 16/08/2022.
//

import Foundation
@testable import AdyenNetworking

struct VenueListRequestMock: URLRequestConvertible {
    typealias ResponseModel = EntityMock
    
    // MARK: - Methods
    
    func asURLRequest() -> URLRequest {
      return URLRequest(url: URL(string: "https://api.foursquare.com/v3/places/search")!)
    }
}
