////
////  ReviewsCell.swift
////  AVCIMOV
////
////  Created by Anıl AVCI on 18.12.2022.
////
//
//import UIKit
//
//class ReviewCell: UITableViewCell {
//
//    @IBOutlet weak var view: UIView!
//    @IBOutlet weak var detailLabel: UILabel!
//    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet weak var imageview: UIImageView!
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        imageview.layer.cornerRadius = 6
//        view.layer.borderColor = UIColor.lightGray.cgColor
//        view.layer.borderWidth = 0.3
//        view.layer.cornerRadius = 16
//        view.backgroundColor = .clear
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//    func configureCell(item: ResultReview) {
//        self.titleLabel.text = item.author?.uppercased()
//        self.detailLabel.text = item.content
//        self.imageview.image = UIImage(named: "spiderman")
//    }
//}
