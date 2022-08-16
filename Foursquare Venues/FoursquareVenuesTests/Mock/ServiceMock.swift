//
//  ServiceMock.swift
//  Foursquare VenuesTests
//
//  Created by Mohamed El Gedawy on 15/08/2022.
//

import Foundation
import AdyenNetworking
@testable import FoursquareVenues


class ServiceMock: ServiceProtocol {
    
    // MARK: - Properties
    
    var error: ServiceError?
    var model: VenuesEntity?
    
    // MARK: - Methods
    
    func makeRequest<Request>(
        request: Request,
        completion: @escaping ServiceCompletion<Request.ResponseModel>) where Request: URLRequestConvertible {
            
            if let error = error {
                completion(.failure(error))
            } else if let model = model {
                completion(.success(model as! Request.ResponseModel))
            }
        }
}

