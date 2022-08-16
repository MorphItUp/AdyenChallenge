//
//  VenueListRequest.swift
//  FoursquareVenues
//
//  Created by Mohamed El Gedawy on 16/08/2022.
//

import Foundation
import AdyenNetworking

struct VenueListRequest: URLRequestConvertible {
    
    typealias ResponseModel = VenuesEntity
    
    // MARK: - Properties
    
    let httpMethod: HTTPMethod = .get
    var radius: Int
    
    // MARK: - Init
    
    init(radius: Int) {
        self.radius = radius
    }
    
    // MARK: - Methods

    func asURLRequest() -> URLRequest {
        var urlComponents = URLComponents(url: URL(string: "https://api.foursquare.com/v3/places/search")!, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = [URLQueryItem]()
        
        let parameters = ["radius": radius, "limit": 50]
        
        for(key, value) in parameters {
            let queryItem = URLQueryItem(name: key, value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
            urlComponents?.queryItems?.append(queryItem)
        }
        
        var request = URLRequest(url: URL(string: "https://api.foursquare.com/v3/places/search")!)
        request.url = urlComponents?.url
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = ["Authorization": "fsq3VgYJDoHjyUfurVygAzugHz9AvT7y1uW7iBZd7o5lrww="]
        
        return request
    }
    
}
