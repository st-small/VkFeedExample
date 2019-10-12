//
//  NetworkDataFetcher.swift
//  VkFeedExample
//
//  Created by Станислав Шияновский on 10/5/19.
//  Copyright © 2019 Станислав Шияновский. All rights reserved.
//

import Foundation

public protocol DataFetcher {
    func getFeed(nextBatchFrom: String?, response: @escaping (FeedResponse?) -> ())
    func getUser(response: @escaping (UserResponse?) -> ())
}

public struct NetworkDataFetcher: DataFetcher {
    
    private let networking: Networking
    
    public init(_ networking: Networking) {
        self.networking = networking
    }
    
    public func getFeed(nextBatchFrom: String?, response: @escaping (FeedResponse?) -> ()) {
        
        var params = ["filters": "post, photo"]
        params["start_from"] = nextBatchFrom
        networking.request(path: APIConstants.newsFeed, params: params) { (data, error) in
            if let error = error {
                print("Error recieved requesting data: \(error.localizedDescription)")
                response(nil)
            }
            
            let decoded = self.decodeJSON(type: FeedResponseWrapped.self, from: data)
            response(decoded?.response)
        }
    }
    
    public func getUser(response: @escaping (UserResponse?) -> ()) {
        guard let userId = AuthService.shared.userId else { return }
        let params = ["user_ids": userId,
                      "fields": "photo_100"]
        networking.request(path: APIConstants.user, params: params) { (data, error) in
            if let error = error {
                print("Error recieved requesting data: \(error.localizedDescription)")
                response(nil)
            }
            
            let decoded = self.decodeJSON(type: UserResponseWrapped.self, from: data)
            response(decoded?.response.first)
        }
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard
            let data = from,
            let response = try? decoder.decode(type.self, from: data) else { return nil }
        return response
    }
}
