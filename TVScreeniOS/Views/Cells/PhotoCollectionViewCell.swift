//
//  PhotoCollectionViewCell.swift
//  TVScreeniOS
//
//  Created by Ehtisham Badar on 24/08/2023.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.alpha = 0.5
        imageView.layer.cornerRadius = 20.0
        imageView.clipsToBounds = true
        if let collectionView = superview as? UICollectionView {
            let centerX = collectionView.contentOffset.x + (collectionView.bounds.width / 2)
            let centerXOfCell = collectionView.convert(center, to: collectionView.superview).x
            
            let distance = abs(centerX - centerXOfCell)
            let scale = max(1 - (distance / collectionView.bounds.width), 0.5)
            if scale > 0.8 && scale < 1.2 {
                imageView.alpha = 1.0
            }
        }
    }
    func updateImageAlpha(scale: CGFloat) {
        imageView.alpha = scale
    }
}
