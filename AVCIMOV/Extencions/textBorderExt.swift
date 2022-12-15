//
//  textBorderExt.swift
//  AVCIMOV
//
//  Created by Anıl AVCI on 15.12.2022.
//

import UIKit

class UIOutlinedLabel: UILabel {

    var outlineWidth: CGFloat = 1
    var outlineColor: UIColor = UIColor.azure


    override func drawText(in rect: CGRect) {

        let strokeTextAttributes = [
            NSAttributedString.Key.strokeColor : outlineColor,
            NSAttributedString.Key.strokeWidth : -1 * outlineWidth,
            
        
        ] as [NSAttributedString.Key : Any]

        self.attributedText = NSAttributedString(string: self.text ?? "", attributes: strokeTextAttributes)
        super.drawText(in: rect)
    }
}
extension UIColor {
  @nonobjc class var dark: UIColor {
    return UIColor(red: 36.0 / 255.0, green: 42.0 / 255.0, blue: 50.0 / 255.0, alpha: 1.0)
  }
  @nonobjc class var azure: UIColor {
    return UIColor(red: 2.0 / 255.0, green: 150.0 / 255.0, blue: 229.0 / 255.0, alpha: 1.0)
  }
}
