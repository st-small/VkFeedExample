//
//  NewsfeedModels.swift
//  VkFeedExample
//
//  Created by Станислав Шияновский on 10/5/19.
//  Copyright (c) 2019 Станислав Шияновский. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

public enum Newsfeed {
  // MARK: Use cases
  
  public enum Model {
    public struct Request {
        public enum RequestType {
            case getNewsFeed
            case getUser
            case revealPostIds(postId: Int)
            case getNextBatch
        }
    }
    public struct Response {
        public enum ResponseType {
            case presentNewsFeed(feed: FeedResponse, revealedPostIds: [Int])
            case presentUserInfo(user: UserResponse?)
            case presentFooterLoader
        }
    }
    public struct ViewModel {
        public enum ViewModelType {
            case displayNewsfeed(feedViewModel: FeedViewModel)
            case displayUser(userViewModel: UserViewModel)
            case displayFooterLoader
        }
    }
  }
}

public struct UserViewModel: TtitleViewViewModel {
    public var photoUrlString: String?
}

public struct FeedViewModel {
    public struct Cell: FeedCellViewModel {
        
        public var postId: Int
        
        public var iconUrlString: String
        public var name: String
        public var date: String
        public var text: String?
        public var likes: String?
        public var comments: String?
        public var shares: String?
        public var views: String?
        public var photoAttachments: [FeedCellPhotoAttachmentViewModel]
        public var sizes: FeedCellSizes
    }
    
    public struct FeedCellPhotoAttachment: FeedCellPhotoAttachmentViewModel {
        public var photoUrlString: String?
        public var width: Int
        public var height: Int
    }
    
    let cells: [Cell]
    let footerTitle: String?
}
