//
//  WatchListCell.swift
//  AVCIMOV
//
//  Created by Anıl AVCI on 22.12.2022.
//

import UIKit

class WatchListCell: UITableViewCell {
    @IBOutlet weak var watchListCellView: UIView!
    @IBOutlet weak var watchListImageView: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var movieMinutes: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var imdbLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        watchListImageView.backgroundColor = UIColor(red: 0.85, green: 0.20, blue: 0.31, alpha: 1.00)
        watchListImageView.layer.cornerRadius = 10
        watchListImageView.layer.shadowColor = UIColor.darkGray.cgColor
        watchListImageView.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        watchListImageView.layer.shadowRadius = 4.0
        watchListImageView.layer.shadowOpacity = 0.4
        watchListImageView.layer.cornerRadius = 10
        watchListImageView.clipsToBounds = true    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   


    func configureCell(item: Favorites) {
        self.movieTitle.text = item.title
        self.detailLabel.text = item.detail
        let image = NetworkHelper.shared.baseImageUrl + item.image!
        self.watchListImageView.kf.setImage(with: URL(string: image))
        self.imdbLabel.text = "IMDB: \(item.imdb!)"
        self.genreLabel.text = "Origin: \(item.origin!.uppercased())"
    }


}
