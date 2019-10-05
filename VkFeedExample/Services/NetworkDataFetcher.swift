//
//  NetworkDataFetcher.swift
//  VkFeedExample
//
//  Created by Станислав Шияновский on 10/5/19.
//  Copyright © 2019 Станислав Шияновский. All rights reserved.
//

import Foundation

public protocol DataFetcher {
    func getFeed(response: @escaping (FeedResponse?) -> ())
}

public struct NetworkDataFetcher: DataFetcher {
    
    private let networking: Networking
    
    public init(_ networking: Networking) {
        self.networking = networking
    }
    
    public func getFeed(response: @escaping (FeedResponse?) -> ()) {
        
        let params = ["filters": "post, photo"]
        networking.request(path: APIConstants.newsFeed, params: params) { (data, error) in
            if let error = error {
                print("Error recieved requesting data: \(error.localizedDescription)")
                response(nil)
            }
            
            let decoded = self.decodeJSON(type: FeedResponseWrapped.self, from: data)
            response(decoded?.response)
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
