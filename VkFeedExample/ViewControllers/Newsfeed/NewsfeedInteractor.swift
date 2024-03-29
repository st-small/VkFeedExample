//
//  NewsfeedInteractor.swift
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

public protocol NewsfeedBusinessLogic {
    func makeRequest(request: Newsfeed.Model.Request.RequestType)
}

public protocol NewsfeedDataStore {
    //var name: String { get set }
}

public class NewsfeedInteractor: NewsfeedBusinessLogic, NewsfeedDataStore {
    
    public var presenter: NewsfeedPresentationLogic?
    private var worker: NewsfeedWorker?
    
    // MARK: Do something
    public func makeRequest(request: Newsfeed.Model.Request.RequestType) {
        if worker == nil {
            worker = NewsfeedWorker()
        }
        
        switch request {
        case .getNewsFeed:
            worker?.getFeed(completion: { [weak self]  (revealPostIds, feed) in
                self?.presenter?.presentData(response: .presentNewsFeed(feed: feed, revealedPostIds: revealPostIds))
            })
        case .getUser:
            worker?.getUser(completion: { [weak self] (user) in
                self?.presenter?.presentData(response: .presentUserInfo(user: user))
            })
        case .revealPostIds(let postId):
            worker?.revealPostIds(forPostId: postId, completion: { [weak self] (revealedPostIds, feed) in
                self?.presenter?.presentData(response: .presentNewsFeed(feed: feed, revealedPostIds: revealedPostIds))
            })
        case .getNextBatch:
            presenter?.presentData(response: .presentFooterLoader)
            worker?.getNextBatch(completion: { [weak self] (revealedPostIds, feed) in
                self?.presenter?.presentData(response: .presentNewsFeed(feed: feed, revealedPostIds: revealedPostIds))
            })
        }
    }
}
