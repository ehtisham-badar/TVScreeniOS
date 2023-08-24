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
    }
    func updateImageAlpha(scale: CGFloat, cornerRadius: CGFloat) {
        imageView.alpha = scale
        imageView.layer.cornerRadius = cornerRadius
    }
}
