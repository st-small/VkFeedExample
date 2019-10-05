//
//  FeedResponse.swift
//  VkFeedExample
//
//  Created by Станислав Шияновский on 10/5/19.
//  Copyright © 2019 Станислав Шияновский. All rights reserved.
//

import Foundation

public struct FeedResponseWrapped: Decodable {
    let response: FeedResponse
}

public struct FeedResponse: Decodable {
    var items: [FeedItem]
}

public struct FeedItem: Decodable {
    let sourceId: Int
    let postId: Int
    let text: String?
    let date: Double
    let comments: CountableItem?
    let likes: CountableItem?
    let reposts: CountableItem?
    let views: CountableItem?
}

public struct CountableItem: Decodable {
    let count: Int
}
