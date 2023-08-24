//
//  LiveTvViewController.swift
//  TVScreeniOS
//
//  Created by Ehtisham Badar on 24/08/2023.
//

import UIKit

class LiveTvViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var liveTvView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var curvedView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        curvedView.layer.cornerRadius = 250
        liveTvView.layer.cornerRadius = 8.0
        setLayout()
    }
    
    private func setLayout() {
        let layout = OverlappingFlowLayout()
        collectionView.collectionViewLayout = layout
        let initialIndexPath = IndexPath(item: 1, section: 0)
        collectionView.scrollToItem(at: initialIndexPath, at: .centeredHorizontally, animated: false)
    }
}

extension LiveTvViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        cell.imageView.image = UIImage(named: "spidey")
        cell.imageView.layer.cornerRadius = 50
        cell.imageView.clipsToBounds = true
        cell.imageView.layer.masksToBounds = false
        return cell
    }
}
