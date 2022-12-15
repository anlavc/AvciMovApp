//
//  HomeVC.swift
//  AVCIMOV
//
//  Created by Anıl AVCI on 12.12.2022.
//

import UIKit

class HomeVC: UIViewController {
    var imageArray:[String] = ["1917img","ayla","duneposter","ersan","fury","holmes","thor"]
    var numberArray:[String]=["1","2","3","4","5","6","7"]
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var detailIcon: UIBarButtonItem!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var container1: UIView!
    @IBOutlet weak var container2: UIView!
    @IBOutlet weak var container3: UIView!
    @IBOutlet weak var container4: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
       setupUI()
    }
    @IBAction func segmentedControlTapped(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            UIView.animate(withDuration: 0.3, animations: {
                self.container1.alpha = 1
                self.container2.alpha = 0
                self.container3.alpha = 0
                self.container4.alpha = 0
            })
        } else  if sender.selectedSegmentIndex == 1 {
            UIView.animate(withDuration: 0.3, animations: {
                self.container1.alpha = 0
                self.container2.alpha = 1
                self.container3.alpha = 0
                self.container4.alpha = 0
            })
        } else  if sender.selectedSegmentIndex == 2 {
            UIView.animate(withDuration: 0.3, animations: {
                self.container1.alpha = 0
                self.container2.alpha = 0
                self.container3.alpha = 1
                self.container4.alpha = 0
            })
        } else  {
            UIView.animate(withDuration: 0.3, animations: {
                self.container1.alpha = 0
                self.container2.alpha = 0
                self.container3.alpha = 0
                self.container4.alpha = 1
            })
            
        }
    }
    
    private func setupUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
        segmentedControl.selectedSegmentIndex = 0
        self.container2.alpha = 0
        self.container3.alpha = 0
        self.container4.alpha = 0
        
        let nibCell=UINib(nibName: "HomeTopCell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: "topCell")
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.collectionView?.showsVerticalScrollIndicator = false
            layout.collectionView?.showsHorizontalScrollIndicator = false
        }
    }
    
    @IBAction func detailIconClicked(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "detailVC")
                                                
                self.show(vc!, sender: nil)
    }
    
}

//MARK: - CollectionViewDelegate


extension HomeVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topCell", for: indexPath) as! HomeTopCell
        cell.imageView.image = UIImage(named: imageArray[indexPath.row])
        cell.textLabel.text = numberArray[indexPath.row]
        return cell
    }

}
