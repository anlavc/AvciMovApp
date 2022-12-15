//
//  UpcomingVC.swift
//  AVCIMOV
//
//  Created by Anıl AVCI on 14.12.2022.
//

import UIKit

class UpcomingVC: UIViewController {

  
    var imageArray:[String] = ["thor","holmes","duneposter","ersan","fury","ayla","1917img"]
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    
    private func setupUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
       
        
        let nibCell=UINib(nibName: "UpcomingCell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: "upcomingCell")
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.collectionView?.showsVerticalScrollIndicator = false
            layout.collectionView?.showsHorizontalScrollIndicator = false
        }
    }
    
  

}

//MARK: - CollectionViewDelegate


extension UpcomingVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCell", for: indexPath) as! UpcomingCell
        cell.imageView.image = UIImage(named: imageArray[indexPath.row])
     
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 140)
    }
}
