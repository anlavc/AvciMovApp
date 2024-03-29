//
//  TopRatedVC.swift
//  AVCIMOV
//
//  Created by Anıl AVCI on 14.12.2022.
//

import UIKit

class TopRatedVC: UIViewController {
    let cell = "playingCell"

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    

    
    private func setupUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
        TopRatedVM.shared.delegate = self
        TopRatedVM.shared.getTopRated{ errorMessage in
            if let errorMessage = errorMessage {
                print("error \(errorMessage)")
            }
        }
        
        let nibCell=UINib(nibName: "PlayingCell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: cell)
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.collectionView?.showsVerticalScrollIndicator = false
            layout.collectionView?.showsHorizontalScrollIndicator = false
        }
    }

}
extension TopRatedVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TopRatedVM.shared.topRated.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cell, for: indexPath) as! PlayingCell
        let item = TopRatedVM.shared.topRated[indexPath.row]
        cell.configureCell(item: item)
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailsViewController
        DetailVM.shared.movieID = TopRatedVM.shared.topRated[indexPath.row].id
        AboutViewController.detailAbout = TopRatedVM.shared.topRated[indexPath.row].overview
        navigationController?.pushViewController(vc, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 140)
    }
    
}
extension TopRatedVC: TopRatedDelegate {
    func didGetTopRated(isDone: Bool) {
        if isDone {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}
