//
//  FilmTableViewCell.swift
//  TVScreeniOS
//
//  Created by Ehtisham Badar on 26/08/2023.
//

import UIKit

class FilmTableViewCell: UITableViewCell {
    
    @IBOutlet weak var sectionHeading: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: MovieViewModel? = MovieViewModel()
    var sectionIndex: Int = -1
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "FilmInnerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FilmInnerCollectionViewCell")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}

extension FilmTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel?.movieData?.sections[sectionIndex].movies.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilmInnerCollectionViewCell", for: indexPath) as? FilmInnerCollectionViewCell else { return UICollectionViewCell() }
        let imageName = self.viewModel?.movieData?.sections[sectionIndex].movies[indexPath.item] ?? ""
        cell.imageview.image = UIImage(named: imageName)
        if let image = UIImage(named: imageName) {
            if let brightestColor = extractBrightestColor(from: image) {
                cell.blurView.backgroundColor = brightestColor
            }
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 150)
    }
    func extractBrightestColor(from image: UIImage) -> UIColor? {
        guard let cgImage = image.cgImage else {
            return nil
        }
        let width = cgImage.width
        let height = cgImage.height
        let pixelData = cgImage.dataProvider!.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        var brightestBrightness: CGFloat = 0
        var brightestColor: UIColor?
        for y in 0..<height {
            for x in 0..<width {
                let pixelInfo: Int = ((width * y) + x) * 4
                let red = CGFloat(data[pixelInfo])
                let green = CGFloat(data[pixelInfo + 1])
                let blue = CGFloat(data[pixelInfo + 2])
                let brightness = (0.299 * red + 0.587 * green + 0.114 * blue) / 255.0
                if brightness > brightestBrightness {
                    brightestBrightness = brightness
                    brightestColor = UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: 1.0)
                }
            }
        }
        return brightestColor
    }
}
