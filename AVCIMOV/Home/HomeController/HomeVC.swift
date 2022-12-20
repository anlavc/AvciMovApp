//
//  HomeVC.swift
//  AVCIMOV
//
//  Created by Anıl AVCI on 12.12.2022.
//

import UIKit

class HomeVC: UIViewController {
   
    let topCell = "HomeTopCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var topRatedLineine: UIView!
    @IBOutlet weak var populerLime: UIView!
    @IBOutlet weak var playingLine: UIView!
    @IBOutlet weak var container1: UIView!
    @IBOutlet weak var container2: UIView!
    @IBOutlet weak var container3: UIView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
       setupUI()
    }
    private func setupUI() {
        navigationItem.title = "What do you want to watch?"
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.container2.alpha = 0
        self.container3.alpha = 0
        self.topRatedLineine.alpha = 0
        self.populerLime.alpha = 0
        
        
        let nibCell=UINib(nibName: topCell, bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: "topCell")
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.collectionView?.showsVerticalScrollIndicator = false
            layout.collectionView?.showsHorizontalScrollIndicator = false
        }
        MainVM.shared.delegate = self
        MainVM.shared.getTopRated{ errorMessage in
            if let errorMessage = errorMessage {
                print("error \(errorMessage)")
            }
        }
    }
    
    @IBAction func homeTabClicked(_ sender: UIButton) {
        if sender.currentTitle == "Now Playing" {
            UIView.animate(withDuration: 0.3, animations: {
                self.container1.alpha = 1
                self.container2.alpha = 0
                self.container3.alpha = 0
                self.playingLine.alpha = 1
                self.topRatedLineine.alpha = 0
                self.populerLime.alpha = 0
                
             
            })
        } else if sender.currentTitle == "Populer" {
            UIView.animate(withDuration: 0.3, animations: {
                self.container1.alpha = 0
                self.container2.alpha = 1
                self.container3.alpha = 0
                self.playingLine.alpha = 0
                self.topRatedLineine.alpha = 0
                self.populerLime.alpha = 1
          
             
            })
        } else if  sender.currentTitle == "Top Rated"  {
            UIView.animate(withDuration: 0.3, animations: {
                self.container1.alpha = 0
                self.container2.alpha = 0
                self.container3.alpha = 1
                self.playingLine.alpha = 0
                self.topRatedLineine.alpha = 1
                self.populerLime.alpha = 0
            })
        }
    }
    
}

//MARK: - CollectionViewDelegate


extension HomeVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MainVM.shared.topRated.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topCell", for: indexPath) as! HomeTopCell
        let item = MainVM.shared.topRated[indexPath.item]
        cell.configureCell(item: item)
        cell.textLabel.text = "\(indexPath.item + 1) "
//        cell.imageView.image = UIImage(named: imageArray[indexPath.row])
//        cell.textLabel.text = numberArray[indexPath.row]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailsViewController
        DetailVM.shared.movieID = MainVM.shared.topRated[indexPath.row].id
        AboutViewController.detailAbout = MainVM.shared.topRated[indexPath.row].overview
        navigationController?.pushViewController(vc, animated: true)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let offsetX = scrollView.contentOffset.x
        let contentWidth = scrollView.contentSize.width
        let width = scrollView.frame.size.width
        
        if offsetX >= contentWidth - (3 * width) {
            MainVM.shared.getTopRated{ errorMessage in
                if let errorMessage = errorMessage {
                    print("error \(errorMessage)")
                }
            }
        }
    }
}
extension HomeVC: MainVMDelegate {
    func didGetTopRated(isDone: Bool) {
        if isDone {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}
