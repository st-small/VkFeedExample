//
//  FeedResponse.swift
//  VkFeedExample
//
//  Created by Станислав Шияновский on 10/5/19.
//  Copyright © 2019 Станислав Шияновский. All rights reserved.
//

import Foundation

public struct FeedResponseWrapped: Decodable {
    public let response: FeedResponse
}

public struct FeedResponse: Decodable {
    public var items: [FeedItem]
    public var profiles: [Profile]
    public var groups: [Group]
}

public struct FeedItem: Decodable {
    public let sourceId: Int
    public let postId: Int
    public let text: String?
    public let date: Double
    public let comments: CountableItem?
    public let likes: CountableItem?
    public let reposts: CountableItem?
    public let views: CountableItem?
}

public struct CountableItem: Decodable {
    public let count: Int
}

public protocol ProfileRepresentable {
    var id: Int { get }
    var name: String { get }
    var photo: String { get }
}

public struct Profile: Decodable, ProfileRepresentable {
    public let id: Int
    public let firstName: String
    public let lastName: String
    public let photo100: String
    
    public var name: String { return firstName + " " + lastName }
    public var photo: String { return photo100 }
}

public struct Group: Decodable, ProfileRepresentable {
    public let id: Int
    public let name: String
    public let photo100: String
    
    public var photo: String { return photo100 }
}
