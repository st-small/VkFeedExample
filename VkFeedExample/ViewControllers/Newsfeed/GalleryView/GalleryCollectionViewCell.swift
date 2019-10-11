//
//  GalleryCollectionViewCell.swift
//  VkFeedExample
//
//  Created by Станислав Шияновский on 10/11/19.
//  Copyright © 2019 Станислав Шияновский. All rights reserved.
//

import Foundation
import UIKit

public class GalleryCollectionViewCell: UICollectionViewCell {
    
    public static let reuseId = "GalleryCollectionViewCell"
    
    private let myImageView: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = #colorLiteral(red: 0.8901960784, green: 0.8980392157, blue: 0.9098039216, alpha: 1)
        return imageView
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(myImageView)
        
        // myImageView constraints
        myImageView.fillSuperview()
    }
    
    public override func prepareForReuse() {
        myImageView.image = nil
    }
    
    public func set(imageURL: String?) {
        myImageView.set(imageURL: imageURL)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        myImageView.layer.masksToBounds = true
        myImageView.layer.cornerRadius = 10
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 2.5, height: 4)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
