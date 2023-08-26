//
//  FilmInnerCollectionViewCell.swift
//  TVScreeniOS
//
//  Created by Ehtisham Badar on 26/08/2023.
//

import UIKit

class FilmInnerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var blurView: UIView!
    @IBOutlet weak var mainview: UIView!
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var visualEffect: UIVisualEffectView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainview.layer.cornerRadius = 15.0
        imageview.layer.cornerRadius = 15.0
        imageview.clipsToBounds = true
        visualEffect.clipsToBounds = true
        visualEffect.layer.cornerRadius = 15.0
        visualEffect.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        blurView.layer.cornerRadius = 15.0
        blurView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }

}
