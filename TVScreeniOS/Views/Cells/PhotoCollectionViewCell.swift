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
    }
    func updateImageAlpha(scale: CGFloat) {
        imageView.alpha = scale
    }
}
