//
//  NewsfeedCell.swift
//  VkFeedExample
//
//  Created by Станислав Шияновский on 10/5/19.
//  Copyright © 2019 Станислав Шияновский. All rights reserved.
//

import UIKit

public protocol FeedCellViewModel {
    var iconUrlString: String { get }
    var name: String { get }
    var date: String { get }
    var text: String? { get }
    var likes: String? { get }
    var comments: String? { get }
    var shares: String? { get }
    var views: String? { get }
}

public class NewsfeedCell: UITableViewCell {
    
    public static let reuseId = "NewsfeedCell"
    
    // UI elements
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var postLabel: UILabel!
    @IBOutlet private weak var likesLabel: UILabel!
    @IBOutlet private weak var commentsLabel: UILabel!
    @IBOutlet private weak var sharesLabel: UILabel!
    @IBOutlet private weak var viewsLabel: UILabel!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func set(viewModel: FeedCellViewModel) {
        nameLabel.text = viewModel.name
        dateLabel.text = viewModel.date
        postLabel.text = viewModel.text
        likesLabel.text = viewModel.likes
        commentsLabel.text = viewModel.comments
        sharesLabel.text = viewModel.shares
        viewsLabel.text = viewModel.views
    }
}
