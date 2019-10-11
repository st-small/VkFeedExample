//
//  RowLayout.swift
//  VkFeedExample
//
//  Created by Станислав Шияновский on 10/11/19.
//  Copyright © 2019 Станислав Шияновский. All rights reserved.
//

import Foundation
import UIKit

public protocol RowLayoutDelegate: class {
    func collectionView(_ collectionView: UICollectionView, photoAtIndexPath indexPath: IndexPath) -> CGSize
}

public class RowLayout: UICollectionViewLayout {
    
    public weak var delegate: RowLayoutDelegate!
    private static var numberOfRows = 2
    private var cellPadding: CGFloat = 8
    
    private var cache = [UICollectionViewLayoutAttributes]()
    private var contentWidth: CGFloat = 0
    private var contentHeight: CGFloat {
        
        guard let collectionView = collectionView else { return 0}
        
        let insets = collectionView.contentInset
        return collectionView.bounds.height - (insets.left + insets.right)
    }
    
    public override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    public override func prepare() {
        
        contentWidth = 0
        cache = []
        
        guard cache.isEmpty == true, let collectionView = collectionView else { return }
        var photos = [CGSize]()
        for item in 0 ..< collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            let photoSize = delegate.collectionView(collectionView, photoAtIndexPath: indexPath)
            photos.append(photoSize)
        }
        
        let superViewWidth = collectionView.frame.width
        
        guard var rowHeight = RowLayout.rowHeightCounter(superviewWidth: superViewWidth, photosArray: photos) else { return }
        rowHeight = rowHeight / CGFloat(RowLayout.numberOfRows)
        
        let photosRatios = photos.map { $0.height / $0.width }
        
        var yOffset = [CGFloat]()
        for row in 0 ..< RowLayout.numberOfRows {
            yOffset.append(CGFloat(row) * rowHeight)
        }
        
        var xOffset = [CGFloat](repeating: 0, count: RowLayout.numberOfRows)
        
        var row = 0
        for item in 0 ..< collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            
            let ratio = photosRatios[indexPath.row]
            let width = rowHeight / ratio
            let frame = CGRect(x: xOffset[row], y: yOffset[row], width: width, height: rowHeight)
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            
            let attribute = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attribute.frame = insetFrame
            cache.append(attribute)
            
            contentWidth = max(contentWidth, frame.maxX)
            xOffset[row] = xOffset[row] + width
            row = row < (RowLayout.numberOfRows - 1) ? (row + 1) : 0
        }
    }
    
    public static func rowHeightCounter(superviewWidth: CGFloat, photosArray: [CGSize]) -> CGFloat? {
        var rowHeight: CGFloat
        
        let photoWithMinRatio = photosArray.min(by: { ($0.height/$0.width) < ($1.height/$1.width)})
        guard let myPhotoWithMinRatio = photoWithMinRatio else { return nil }
        
        let difference = superviewWidth / myPhotoWithMinRatio.width
        
        rowHeight = myPhotoWithMinRatio.height * difference
        rowHeight = rowHeight * CGFloat(RowLayout.numberOfRows)
        
        return rowHeight
    }
    
    public override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attribute in cache {
            if attribute.frame.intersects(rect) {
                visibleLayoutAttributes.append(attribute)
            }
        }
        
        return visibleLayoutAttributes
    }
    
    public override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.row]
    }
}

