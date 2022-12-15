//
//  DetailsViewController.swift
//  AVCIMOV
//
//  Created by Anıl AVCI on 15.12.2022.
//

import UIKit

class DetailsViewController: UIViewController {
   
    
   
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
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       

     setupUI()
    }
    
    @IBAction func backButtonClicked(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    @IBAction func aboutButtonClicked(_ sender: UIButton) {
    }
    
    @IBAction func reviewsButtonClicked(_ sender: UIButton) {
    }
    
    @IBAction func castButtonClicked(_ sender: Any) {
    }
    
  
    @objc func backAction(){
        print("Back Button Clicked")
        dismiss(animated: true, completion: nil)
    }
    func setupUI() {
        
        pointView.layer.masksToBounds = false
        pointView.layer.cornerRadius = 5
        pointView.clipsToBounds = true
        
        posterImageview.layer.masksToBounds = false
        
        posterImageview.layer.cornerRadius = 10
        posterImageview.clipsToBounds = true
        
        //NavigationBackButtonSetting
        self.navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.topItem?.title = ""
    }
}
