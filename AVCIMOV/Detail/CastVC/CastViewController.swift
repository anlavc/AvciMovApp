//
//  CastViewController.swift
//  AVCIMOV
//
//  Created by Anıl AVCI on 16.12.2022.
//

import UIKit

class CastViewController: UIViewController {
    let castCell = "detailCell"
    @IBOutlet weak var collectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        CastVM.shared.getCast{ errorMessage in
            if let errorMessage = errorMessage {
                print("error \(errorMessage)")
            }
        }
    }

    func setupUI() {

        collectionview.delegate = self
        collectionview.dataSource = self
        CastVM.shared.delegate = self
        let nibCell=UINib(nibName: "DetailCell", bundle: nil)
        collectionview.register(nibCell, forCellWithReuseIdentifier: castCell)
        
        if let layout = collectionview.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.collectionView?.showsVerticalScrollIndicator = false
            layout.collectionView?.showsHorizontalScrollIndicator = false
        }
    }

}
extension CastViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CastVM.shared.cast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: castCell, for: indexPath) as! DetailCell
        let item = CastVM.shared.cast[indexPath.row]
        cell.configureCell(item: item)
        
     
  
     
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 4 , height: collectionView.frame.height / 1.8)
    }
}
extension CastViewController: CastDelegate {
    func didGetCast(isDone: Bool) {
        if isDone {
            DispatchQueue.main.async {
                self.collectionview.reloadData()
            }
        }
    }
}
