//
//  NetworkService.swift
//  VkFeedExample
//
//  Created by Станислав Шияновский on 10/4/19.
//  Copyright © 2019 Станислав Шияновский. All rights reserved.
//

import Foundation

public typealias NetworkHandler = (Data?, Error?) -> ()

public protocol Networking: class {
    func request(path: String, params: [String: String], completion: @escaping NetworkHandler)
}

public final class NetworkService: Networking {
    
    private let authService: AuthService
    
    public init(_ authService: AuthService = AuthService.shared) {
        self.authService = authService
    }
    
    public func request(path: String, params: [String : String], completion: @escaping NetworkHandler) {
        guard let token = authService.token else { return }
        var allParams = params
        allParams["access_token"] = token
        allParams["v"] = APIConstants.version
        let url = self.url(from: APIConstants.newsFeed, params: allParams)
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping NetworkHandler) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        })
    }
    
    private func url(from path: String, params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = APIConstants.scheme
        components.host = APIConstants.host
        components.path = path
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
        return components.url!
    }
}
