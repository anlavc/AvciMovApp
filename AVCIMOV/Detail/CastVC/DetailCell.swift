//
//  DetailCell.swift
//  AVCIMOV
//
//  Created by Anıl AVCI on 15.12.2022.
//

import UIKit

class DetailCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageview.layer.masksToBounds = false
        imageview.layer.cornerRadius = imageview.frame.height / 2
        imageview.clipsToBounds = true
    }
    func configureCell(item: Cast) {
        self.nameLabel.text = item.name
        if item.profilePath != nil {
            let image = NetworkHelper.shared.baseImageUrl + item.profilePath!
            self.imageview.kf.setImage(with: URL(string: image))
        } else {
            let image = "https://artsmidnorthcoast.com/wp-content/uploads/2014/05/no-image-available-icon-6.png"
            self.imageview.kf.setImage(with: URL(string: image))
        }
        self.imageview.kf.indicatorType = .activity
    }
}
