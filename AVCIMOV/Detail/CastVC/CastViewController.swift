//
//  CastViewController.swift
//  AVCIMOV
//
//  Created by Anıl AVCI on 16.12.2022.
//

import UIKit

class CastViewController: UIViewController {
    var imageArray:[String] = ["1917img","ayla","duneposter","ersan","fury","holmes","thor"]
    @IBOutlet weak var collectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
setupUI()
    }
    

    func setupUI() {

        collectionview.delegate = self
        collectionview.dataSource = self
        
        let nibCell=UINib(nibName: "DetailCell", bundle: nil)
        collectionview.register(nibCell, forCellWithReuseIdentifier: "detailCell")
        
        if let layout = collectionview.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.collectionView?.showsVerticalScrollIndicator = false
            layout.collectionView?.showsHorizontalScrollIndicator = false
        }
    }

}
extension CastViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailCell", for: indexPath) as! DetailCell
        
        cell.imageview.image = UIImage(named: imageArray[indexPath.row])
        cell.nameLabel.text = imageArray[indexPath.row]
        
        //image corner
        
        cell.imageview.layer.masksToBounds = false
        cell.imageview.layer.cornerRadius = cell.imageview.frame.height / 2
        cell.imageview.clipsToBounds = true
     
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 140)
    }
}
