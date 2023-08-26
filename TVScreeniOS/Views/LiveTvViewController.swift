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
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = MovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadMovieData { isLoad in
            self.collectionView.reloadData()
            self.tableView.reloadData()
        }
        curvedView.layer.cornerRadius = 250
        liveTvView.layer.cornerRadius = 8.0
        setLayout()
        pageControl.numberOfPages = 10
        tableView.register(UINib(nibName: "FilmTableViewCell", bundle: nil), forCellReuseIdentifier: "FilmTableViewCell")
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
        return self.viewModel.movieData?.movieList.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        cell.imageView.image = UIImage(named: self.viewModel.movieData?.movieList[indexPath.item] ?? "")
        return cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let centerX = scrollView.contentOffset.x + (scrollView.bounds.width / 2)
        
        for case let cell as PhotoCollectionViewCell in collectionView.visibleCells {
            let centerXOfCell = collectionView.convert(cell.center, to: view).x
            let distance = abs(centerX - centerXOfCell)
            let scale = max(1 - (distance / collectionView.bounds.width), 0.5)
            cell.updateImageAlpha(scale: scale)
            if scale > 0.8 && scale < 1.2, let indexPath = collectionView.indexPath(for: cell) {
                pageControl.currentPage = indexPath.item
            }
        }
    }
}

extension LiveTvViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.movieData?.sections.count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FilmTableViewCell") as? FilmTableViewCell else { return UITableViewCell() }
        cell.sectionIndex = indexPath.section
        cell.collectionView.reloadData()
        cell.viewModel = self.viewModel
        cell.sectionHeading.text = self.viewModel.movieData?.sections[indexPath.section].sectionHeading ?? ""
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
