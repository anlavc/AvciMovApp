//
//  SearchVC.swift
//  AVCIMOV
//
//  Created by Anıl AVCI on 15.12.2022.
//

import UIKit

class SearchVC: UIViewController {
//    var moviearray:  [MovieResult] = []
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // MARK: - Xib register
        tableview.dataSource = self
        tableview.delegate = self
        self.tableview.register(UINib(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: "searchCell")
    }
    


}

extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          
//       tableView.setEmptyView(title: "Üzgünüz, Herhangi bir sonuç bulamıyoruz", message: "Filminizi tür başlığı, kategorilere, yıllara göre bulun", messageImage: #imageLiteral(resourceName: "no-results"))
        return 15

       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchTableViewCell
        cell.imageview.image = UIImage(named: "ayla")
        cell.headLabel.text = "Batman"
        cell.pointLabel.text = "8.2"
        cell.categoryLabel.text = "Fantastik"
        cell.dateLabel.text = "2022"
        cell.minutesLabel.text = "155 dakika"
        cell.frame = cell.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
        
    }
  
   
}
