//
//  UserResponse.swift
//  VkFeedExample
//
//  Created by Станислав Шияновский on 10/11/19.
//  Copyright © 2019 Станислав Шияновский. All rights reserved.
//

import Foundation

public struct UserResponseWrapped: Decodable {
    public let response: [UserResponse]
}

public struct UserResponse: Decodable {
    public let photo100: String?
}
