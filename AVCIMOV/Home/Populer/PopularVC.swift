//
//  UpcomingVC.swift
//  AVCIMOV
//
//  Created by Anıl AVCI on 14.12.2022.
//

import UIKit

class PopularVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    let bottomCell = "playingCell"
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    
    private func setupUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
        PopularVM.shared.delegate = self
        PopularVM.shared.getPopular{ errorMessage in
            if let errorMessage = errorMessage {
                print("error \(errorMessage)")
            }
        }
        let nibCell=UINib(nibName: "PlayingCell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: bottomCell)
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.collectionView?.showsVerticalScrollIndicator = false
            layout.collectionView?.showsHorizontalScrollIndicator = false
        }
    }
    
  

}

//MARK: - CollectionViewDelegate


extension PopularVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PopularVM.shared.popular.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bottomCell, for: indexPath) as! PlayingCell
        let item = PopularVM.shared.popular[indexPath.row]
        cell.configureCell(item: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 140)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailsViewController
        DetailVM.shared.movieID = PopularVM.shared.popular[indexPath.row].id
        AboutViewController.detailAbout = PopularVM.shared.popular[indexPath.row].overview
        navigationController?.pushViewController(vc, animated: true)
    }
}
extension PopularVC: PopularDelegate {
    func didGetPopular(isDone: Bool) {
        if isDone {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}
