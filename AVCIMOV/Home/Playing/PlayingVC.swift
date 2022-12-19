//
//  PlayingVC.swift
//  AVCIMOV
//
//  Created by Anıl AVCI on 13.12.2022.
//

import UIKit

class PlayingVC: UIViewController {
//    var imageArray:[String] = ["1917img","ayla","duneposter","ersan","fury","holmes","thor"]
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    
    private func setupUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
       
        
        let nibCell=UINib(nibName: "PlayingCell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: "playingCell")
        PlayingVM.shared.delegate = self
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.collectionView?.showsVerticalScrollIndicator = false
            layout.collectionView?.showsHorizontalScrollIndicator = false
        }
        PlayingVM.shared.getLatest{ errorMessage in
            if let errorMessage = errorMessage {
                print("error \(errorMessage)")
            }
        }
    }
    
  

}

//MARK: - CollectionViewDelegate


extension PlayingVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PlayingVM.shared.latest.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "playingCell", for: indexPath) as! PlayingCell
        let item = PlayingVM.shared.latest[indexPath.row]
        cell.configureCell(item: item)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailsViewController
        DetailVM.shared.movieID = PlayingVM.shared.latest[indexPath.row].id
        AboutViewController.detailAbout = PlayingVM.shared.latest[indexPath.row].overview
        navigationController?.pushViewController(vc, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 140)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY >= contentHeight - (4 * height) {
            
            PlayingVM.shared.getLatest{ errorMessage in
                if let errorMessage = errorMessage {
                    print("error \(errorMessage)")
                }
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

extension PlayingVC: LatestDelegate {
    func didGetLatest(isDone: Bool) {
        if isDone {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}
