//
//  URLRequestConvertible.swift
//  
//
//  Created by Mohamed El Gedawy on 11/08/2022.
//

import Foundation

// MARK: - URLRequestConvertible Protocol

public protocol URLRequestConvertible {
    associatedtype ResponseModel: Decodable
    func asURLRequest() -> URLRequest
}

