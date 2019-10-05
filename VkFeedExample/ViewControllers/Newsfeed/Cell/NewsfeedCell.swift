//
//  NewsfeedCell.swift
//  VkFeedExample
//
//  Created by Станислав Шияновский on 10/5/19.
//  Copyright © 2019 Станислав Шияновский. All rights reserved.
//

import UIKit

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
        
        // some code here...
    }
}
