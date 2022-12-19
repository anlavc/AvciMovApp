//
//  AboutViewController.swift
//  AVCIMOV
//
//  Created by Anıl AVCI on 18.12.2022.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var aboutTextvView: UITextView!
    static var detailAbout: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        aboutTextvView.isEditable = false
        aboutTextvView.text = AboutViewController.detailAbout
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
