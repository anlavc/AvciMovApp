//
//  HomeTopCell.swift
//  AVCIMOV
//
//  Created by Anıl AVCI on 12.12.2022.
//

import UIKit

class HomeTopCell: UICollectionViewCell {
    
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
//
//        textLabel.layer.shadowColor = UIColor.azure.cgColor
//        textLabel.textColor = UIColor.dark
//        textLabel.layer.shadowRadius = 3.0
//        textLabel.layer.shadowOpacity = 1.0
//        textLabel.layer.shadowOffset = CGSize(width: 4, height: 4)
//        textLabel.layer.masksToBounds = false
        
        
        
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
    }
    func configureCell(item: ResultMovie) {
  
        let image = NetworkHelper.shared.baseBackImageUrl + item.backdrop_path!
        self.imageView.kf.setImage(with: URL(string: image))
    }

}


