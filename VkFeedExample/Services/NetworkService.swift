//
//  NetworkService.swift
//  VkFeedExample
//
//  Created by Станислав Шияновский on 10/4/19.
//  Copyright © 2019 Станислав Шияновский. All rights reserved.
//

import Foundation

public final class NetworkService {
    
    private let authService: AuthService
    
    public init(_ authService: AuthService = AuthService.shared) {
        self.authService = authService
    }
    
    public func getFeed() {
        var components = URLComponents()
        guard let token = authService.token else { return }
        let params = ["filters": "post, photo"]
        var allParams = params
        allParams["access_token"] = token
        allParams["v"] = APIConstants.version
        components.scheme = APIConstants.scheme
        components.host = APIConstants.host
        components.path = APIConstants.newsFeed
        components.queryItems = allParams.map { URLQueryItem(name: $0, value: $1) }
        
        guard let url = components.url else { return }
        print(url)
    }
}
