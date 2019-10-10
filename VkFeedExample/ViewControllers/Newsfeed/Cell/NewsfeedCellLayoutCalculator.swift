//
//  NewsfeedCellLayoutCalculator.swift
//  VkFeedExample
//
//  Created by Станислав Шияновский on 10/8/19.
//  Copyright © 2019 Станислав Шияновский. All rights reserved.
//

import Foundation
import UIKit

public struct Sizes: FeedCellSizes {
    public var postLabelFrame: CGRect
    public var attachmentFrame: CGRect
    public var bottomViewFrame: CGRect
    public var totalHeight: CGFloat
}

public struct Constants {
    static let cardInsets = UIEdgeInsets(top: 0, left: 8, bottom: 12, right: 8)
    static let topViewHeight: CGFloat = 60
    static let postLabelInsets = UIEdgeInsets(top: 8 + Constants.topViewHeight + 8, left: 8, bottom: 8, right: 8)
    static let postLabelFont = UIFont.systemFont(ofSize: 15)
    static let bottomViewHeight: CGFloat = 44.0
    
    static let bottomViewViewHeight: CGFloat = 44.0
    static let bottomViewViewWidth: CGFloat = 80.0
    
    static let bottomViewViewsIconSize: CGFloat = 24.0
}

public protocol FeedCellLayoutCalculatorProtocol {
    func sizes(postText: String?, photoAttachment: FeedCellPhotoAttachmentViewModel?) -> FeedCellSizes
}

public final class FeedCellLayoutCalculator: FeedCellLayoutCalculatorProtocol {
    
    private let screenWidth: CGFloat
    
    public init(screenWidth: CGFloat = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)) {
        self.screenWidth = screenWidth
    }
    
    public func sizes(postText: String?, photoAttachment: FeedCellPhotoAttachmentViewModel?) -> FeedCellSizes {
        
        let cardViewWidth = screenWidth - Constants.cardInsets.left - Constants.cardInsets.right
        
        
        // MARK: Работа с postLabelFrame
        var postLabelFrame = CGRect(origin: CGPoint(x: Constants.postLabelInsets.left, y: Constants.postLabelInsets.top), size: .zero)
        if let text = postText, !text.isEmpty {
            let width = cardViewWidth - Constants.postLabelInsets.left - Constants.postLabelInsets.right
            let height = text.height(width: width, font: Constants.postLabelFont)
            
            postLabelFrame.size = CGSize(width: width, height: height)
        }
        
        // MARK: Работа с attachmentFrame
        let attachmentTop = postLabelFrame.size == .zero ? Constants.postLabelInsets.top : postLabelFrame.maxY + Constants.postLabelInsets.bottom
        var attachmentFrame = CGRect(origin: CGPoint(x: 0 , y: attachmentTop),
                                     size: .zero)
        
        if let attachment = photoAttachment {
            let photoHeight = Float(attachment.height)
            let photoWidth = Float(attachment.width)
            let ratio = CGFloat(photoHeight / photoWidth)
            
            attachmentFrame.size = CGSize(width: cardViewWidth, height: cardViewWidth * ratio)
        }
        
        // MARK: Работа с bottomViewFrame
        let bottomViewTop = max(postLabelFrame.maxY, attachmentFrame.maxY)
        let bottomViewFrame = CGRect(origin: CGPoint(x: 0, y: bottomViewTop),
                                     size: CGSize(width: cardViewWidth, height: Constants.bottomViewHeight))
        
        // MARK: Работа с totalHeight
        let totalHeight = bottomViewFrame.maxY + Constants.cardInsets.bottom
        
        return Sizes(postLabelFrame: postLabelFrame,
                     attachmentFrame: attachmentFrame,
                     bottomViewFrame: bottomViewFrame,
                     totalHeight: totalHeight)
    }
}
