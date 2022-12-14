//
//  UpcomingVC.swift
//  AVCIMOV
//
//  Created by Anıl AVCI on 14.12.2022.
//

import UIKit

class UpcomingVC: UIViewController {

  
    var imageArray:[String] = ["1917img","ayla","duneposter","ersan","fury","holmes","thor"]
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    
    private func setupUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
       
        
        let nibCell=UINib(nibName: "UpcomingVC", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: "upcomingCell")
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
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
