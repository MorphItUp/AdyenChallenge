//
//  File.swift
//  
//
//  Created by Mohamed El Gedawy on 16/08/2022.
//

import Foundation

public typealias ServiceResult<T: Decodable> = Result<T, ServiceError>
public typealias ServiceCompletion<T: Decodable> = (ServiceResult<T>) -> Void


public struct Service {
    
    // MARK: - Properties
    
    var session: URLSessionProtocol
    
    // MARK: - Init
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    public init() {
        self.session = URLSession.shared
    }
    
    // MARK: - Methods
    
    public func makeRequest<Request: URLRequestConvertible>(request: Request,
                                                            completion: @escaping ServiceCompletion<Request.ResponseModel>) {
        
        session.dataTask(with: request) { data, reponse, error in
            let serviceResult: ServiceResult<Request.ResponseModel>
            if let error = error {
                serviceResult = .failure(ServiceError(withError: error))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(Request.ResponseModel.self, from: data)
                    serviceResult = .success(response)
                } catch {
                    print(error)
                    serviceResult = .failure(.decoding)
                }
            } else {
                serviceResult = .failure(.unknown)
            }
            DispatchQueue.main.async {
                completion(serviceResult)
            }
        }
        .resumeTask()
    }
    
}
