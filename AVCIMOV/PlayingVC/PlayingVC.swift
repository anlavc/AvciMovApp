//
//  PlayingVC.swift
//  AVCIMOV
//
//  Created by Anıl AVCI on 13.12.2022.
//

import UIKit

class PlayingVC: UIViewController {
    var imageArray:[String] = ["1917img","ayla","duneposter","ersan","fury","holmes","thor"]
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
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
        }
    }
    
  

}

//MARK: - CollectionViewDelegate


extension PlayingVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "playingCell", for: indexPath) as! PlayingCell
        cell.imageView.image = UIImage(named: imageArray[indexPath.row])
     
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 140)
    }
}
