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
    public var bottomView: CGRect
    public var totalHeight: CGFloat
}

public struct Constants {
    static let cardInsets = UIEdgeInsets(top: 0, left: 8, bottom: 12, right: 8)
    static let topViewHeight: CGFloat = 36
    static let postLabelInsets = UIEdgeInsets(top: 8 + Constants.topViewHeight + 8, left: 8, bottom: 8, right: 8)
    static let postLabelFont = UIFont.systemFont(ofSize: 15)
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
        
        return Sizes(postLabelFrame: postLabelFrame,
                     attachmentFrame: .zero,
                     bottomView: .zero,
                     totalHeight: 300)
    }
}
