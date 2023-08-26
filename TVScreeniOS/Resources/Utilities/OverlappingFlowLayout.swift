//
//  OverlappingFlowLayout.swift
//  TVScreeniOS
//
//  Created by Ehtisham Badar on 24/08/2023.
//

import UIKit

class OverlappingFlowLayout: UICollectionViewFlowLayout {
    var isFirstLoad = true
    
    override init() {
        super.init()
        scrollDirection = .horizontal
        minimumLineSpacing = -40
        itemSize = CGSize(width: 250, height: 400)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributesArray = super.layoutAttributesForElements(in: rect)
        let collectionViewCenterX = collectionView!.bounds.midX
        
        for attributes in attributesArray! {
            let distanceFromCenter = abs(attributes.center.x - collectionViewCenterX)
            let scale = max(1 - distanceFromCenter / collectionView!.bounds.width, 0.7)
            attributes.transform = CGAffineTransform(scaleX: scale, y: scale)
            
            if isFirstLoad && attributes.indexPath.item == 1 {
                if let cell = collectionView?.cellForItem(at: attributes.indexPath) as? PhotoCollectionViewCell {
                    cell.updateImageAlpha(scale: 1.0)
                }
            } else {
                if let cell = collectionView?.cellForItem(at: attributes.indexPath) as? PhotoCollectionViewCell {
                    cell.updateImageAlpha(scale: scale)
                }
            }
        }
        
        isFirstLoad = false
        return attributesArray
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}

