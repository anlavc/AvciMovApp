//
//  PlayingCell.swift
//  AVCIMOV
//
//  Created by Anıl AVCI on 13.12.2022.
//

import UIKit

class PlayingCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
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
