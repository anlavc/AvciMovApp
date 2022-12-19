//
//  DetailsViewController.swift
//  AVCIMOV
//
//  Created by Anıl AVCI on 15.12.2022.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {
   
    @IBOutlet weak var aboutline: UIView!
    
    @IBOutlet weak var castlime: UIView!
    @IBOutlet weak var reviewsline: UIView!
    @IBOutlet weak var aboutContainer: UIView!
    @IBOutlet weak var castContainer: UIView!
    @IBOutlet weak var reviewsContainer: UIView!
    @IBOutlet weak var bookmarkIcon: UIBarButtonItem!
    @IBOutlet weak var castButton: UIButton!
    @IBOutlet weak var reviewsButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var headTextLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var pointView: UIView!
    @IBOutlet weak var posterImageview: UIImageView!
    @IBOutlet weak var bannerImageview: UIImageView!
    var detail: MovieDetail?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       

     setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        CastVM.shared.movieID = DetailVM.shared.movieID
        //ReviewVM.shared.movieID = DetailVM.shared.movieID
        DetailVM.shared.getMovieDetail{ errorMessage in
            if let errorMessage = errorMessage {
                print("error \(errorMessage)")
            }
        }
        
//        for i in DetailVM.shared.favoritesArray {
//            if i.movieId == "\(DetailVM.shared.movieID!)" {
//                addButton.setImage(UIImage.init(named: "remove"), for: .normal)
//                buttonChange = .delete
//                break
//            }
//        }
    }
    
    @IBAction func backButtonClicked(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
   
    @IBAction func containerTab(_ sender: UIButton) {
        if sender.currentTitle == "About Movie" {
            UIView.animate(withDuration: 0.3, animations: {
                self.aboutContainer.alpha = 1
                self.reviewsContainer.alpha = 0
                self.castContainer.alpha = 0
                self.aboutline.alpha = 1
                self.reviewsline.alpha = 0
                self.castlime.alpha = 0
             
            })
        } else if sender.currentTitle == "Reviews" {
            UIView.animate(withDuration: 0.3, animations: {
                self.aboutContainer.alpha = 0
                self.reviewsContainer.alpha = 1
                self.castContainer.alpha = 0
                self.aboutline.alpha = 0
                self.reviewsline.alpha = 1
                self.castlime.alpha = 0
             
            })
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                self.aboutContainer.alpha = 0
                self.reviewsContainer.alpha = 0
                self.castContainer.alpha = 1
                self.aboutline.alpha = 0
                self.reviewsline.alpha = 0
                self.castlime.alpha = 1
            })
        }
    }
    
    @objc func backAction(){
        print("Back Button Clicked")
        dismiss(animated: true, completion: nil)
    }
    func setupUI() {
        self.aboutContainer.alpha = 1
        self.reviewsContainer.alpha = 0
        self.castContainer.alpha = 0
        self.aboutline.alpha = 1
        self.reviewsline.alpha = 0
        self.castlime.alpha = 0
        pointView.layer.masksToBounds = false
        pointView.layer.cornerRadius = 5
        pointView.clipsToBounds = true
        DetailVM.shared.delegate = self
        //DetailVM.shared.fetchData()
        posterImageview.layer.masksToBounds = false
        
        posterImageview.layer.cornerRadius = 10
        posterImageview.clipsToBounds = true
        
        //NavigationBackButtonSetting
        self.navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.topItem?.title = ""
    }
}
extension DetailsViewController: DetailDelegate {
    func didGetMovie(isDone: Bool) {
        if isDone {
            DispatchQueue.main.async {
                self.detail = DetailVM.shared.movieDetail
                let image = NetworkHelper.shared.baseBackImageUrl + (self.detail?.backdropPath!)!
                let image2 = NetworkHelper.shared.baseImageUrl + (self.detail?.posterPath!)!
                self.bannerImageview.kf.setImage(with: URL(string: image))
                self.posterImageview.kf.setImage(with: URL(string: image2))
                self.headTextLabel.text = self.detail?.title
                self.yearLabel.text = self.detail?.releaseDate
                self.minutesLabel.text = "\(self.detail?.popularity ?? 0)"
                self.categoryLabel.text = self.detail?.originalLanguage?.uppercased()
                let imdb = String(format: "%.1f", self.detail?.voteAverage ?? 0)
                self.pointLabel.text = imdb
            }
        }
    }
    
    
}
