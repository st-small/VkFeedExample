//
//  TitleView.swift
//  VkFeedExample
//
//  Created by Станислав Шияновский on 10/11/19.
//  Copyright © 2019 Станислав Шияновский. All rights reserved.
//

import Foundation
import UIKit

public protocol TtitleViewViewModel {
    var photoUrlString: String? { get }
}

public class TtitleView: UIView {
    
    private var myTextField = InsertableTextField()
    
    private var myAvatarView: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .orange
        imageView.clipsToBounds = true
        return imageView
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(myTextField)
        addSubview(myAvatarView)
        
        makeConstraints()
    }
    
    public func set(userViewModel: TtitleViewViewModel) {
        myAvatarView.set(imageURL: userViewModel.photoUrlString)
    }
    
    private func makeConstraints() {
        // myAvatar constraints
        let avatarInsets = UIEdgeInsets(top: 4, left: 777, bottom: 777, right: 4)
        myAvatarView.anchor(top: topAnchor,
                            leading: nil,
                            bottom: nil,
                            trailing: trailingAnchor,
                            padding: avatarInsets)
        myAvatarView.heightAnchor.constraint(equalTo: myTextField.heightAnchor, multiplier: 1).isActive = true
        myAvatarView.widthAnchor.constraint(equalTo: myTextField.heightAnchor, multiplier: 1).isActive = true
        
        // myTextField constraints
        let textInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 12)
        myTextField.anchor(top: topAnchor,
                           leading: leadingAnchor,
                           bottom: bottomAnchor,
                           trailing: myAvatarView.leadingAnchor,
                           padding: textInsets)
    }
    
    public override var intrinsicContentSize: CGSize {
        return UIView.layoutFittingExpandedSize
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        myAvatarView.layer.masksToBounds = true
        myAvatarView.layer.cornerRadius = myAvatarView.frame.width / 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
