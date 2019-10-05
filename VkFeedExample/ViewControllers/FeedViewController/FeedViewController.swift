//
//  FeedViewController.swift
//  VkFeedExample
//
//  Created by Станислав Шияновский on 10/4/19.
//  Copyright © 2019 Станислав Шияновский. All rights reserved.
//

import UIKit

public class FeedViewController: UIViewController {
    
    private let fetcher: DataFetcher = NetworkDataFetcher(NetworkService())

    public override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        fetcher.getFeed { (feedResponse) in
            guard let feedResponse = feedResponse else { return }
            _ = feedResponse.items.map { feedItem in
                print(feedItem.date)
            }
        }
    }
}
