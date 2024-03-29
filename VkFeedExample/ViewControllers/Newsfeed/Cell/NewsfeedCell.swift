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
    var photoAttachments: [FeedCellPhotoAttachmentViewModel] { get }
    var sizes: FeedCellSizes { get }
}

public protocol FeedCellSizes {
    var postLabelFrame: CGRect { get }
    var attachmentFrame: CGRect { get }
    var bottomViewFrame: CGRect { get }
    var totalHeight: CGFloat { get }
    var moreTextButtonFrame: CGRect { get }
}

public protocol FeedCellPhotoAttachmentViewModel {
    var photoUrlString: String? { get }
    var width: Int { get }
    var height: Int { get }
}

public class NewsfeedCell: UITableViewCell {
    
    public static let reuseId = "NewsfeedCell"
    
    // UI elements
    @IBOutlet private weak var cardView: UIView!
    @IBOutlet private weak var iconImageView: WebImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var postLabel: UILabel!
    @IBOutlet private weak var postImageView: WebImageView!
    @IBOutlet private weak var likesLabel: UILabel!
    @IBOutlet private weak var commentsLabel: UILabel!
    @IBOutlet private weak var sharesLabel: UILabel!
    @IBOutlet private weak var viewsLabel: UILabel!
    @IBOutlet private weak var bottomView: UIView!
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        
        iconImageView.set(imageURL: nil)
        postImageView.set(imageURL: nil)
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        iconImageView.layer.cornerRadius = iconImageView.frame.width / 2
        iconImageView.clipsToBounds = true
        
        cardView.layer.cornerRadius = 10
        cardView.clipsToBounds = true
        
        backgroundColor = .clear
        selectionStyle = .none
    }
    
//    public func set(viewModel: FeedCellViewModel) {
//        iconImageView.set(imageURL: viewModel.iconUrlString)
//        nameLabel.text = viewModel.name
//        dateLabel.text = viewModel.date
//        postLabel.text = viewModel.text
//        likesLabel.text = viewModel.likes
//        commentsLabel.text = viewModel.comments
//        sharesLabel.text = viewModel.shares
//        viewsLabel.text = viewModel.views
//        
//        postLabel.frame = viewModel.sizes.postLabelFrame
//        postImageView.frame = viewModel.sizes.attachmentFrame
//        bottomView.frame = viewModel.sizes.bottomViewFrame
//        
//        if let photoAttachment = viewModel.photoAttachment {
//                postImageView.set(imageURL: photoAttachment.photoUrlString)
//            postImageView.isHidden = false
//        } else {
//            postImageView.isHidden = true
//        }
//    }
}
