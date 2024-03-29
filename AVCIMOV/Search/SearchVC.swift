//
//  SearchVC.swift
//  AVCIMOV
//
//  Created by Anıl AVCI on 15.12.2022.
//

import UIKit

class SearchVC: UIViewController {
    
    var searchedData: [ResultMovie] = []
    let searchController = UISearchController(searchResultsController: nil)
    var searchCell = "SearchTableViewCell"
    var searching = false
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        
        // MARK: - Xib register
        tableview.dataSource = self
        tableview.delegate = self
        self.tableview.register(UINib(nibName: searchCell, bundle: nil), forCellReuseIdentifier: searchCell)
        SearchVM.shared.delegate = self
        SearchVM.shared.getUpcoming{ errorMessage in
            if let errorMessage = errorMessage {
                print("error \(errorMessage)")
            }
        }
        configureSearchController()
        tableview.reloadData()
        
    }
    
    @IBAction func infoButtonClicked(_ sender: UIBarButtonItem) {
        
               let alert = UIAlertController(title: "Info", message: "You can search for your favorite movies on this page, go to their details and add them to your watch list later.", preferredStyle: UIAlertController.Style.alert)
               let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { UIAlertAction in
               }
               alert.addAction(okButton)
               self.present(alert, animated: true, completion: nil)
               
    }
    func makeAlert(titleInput: String, messageInput:String) {
         let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
         let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
         alert.addAction(okButton)
         self.present(alert, animated: true, completion: nil)
     }
     
    private func configureSearchController() {
        
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.searchTextField.textColor = .lightGray
        searchController.searchBar.searchTextField.leftView?.tintColor = .darkGray
        searchController.searchBar.searchTextField.layer.borderWidth = 0.7
        searchController.searchBar.searchTextField.layer.borderColor = CGColor.init(gray: 0.7, alpha: 0.3)
        searchController.searchBar.searchTextField.layer.cornerRadius = 6
    }
    
}

extension SearchVC: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty {
            searching = true
            searchedData.removeAll()
            for resultData in SearchVM.shared.searchMovie {
                if resultData.title!.lowercased().contains(searchText.lowercased()) {
                    searchedData.append(resultData)
                }
            }
        } else {
            searching = false
            searchedData.removeAll()
            searchedData = SearchVM.shared.searchMovie
        }
        tableview.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchedData.removeAll()
        tableview.reloadData()
    }
}
extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //       tableView.setEmptyView(title: "Üzgünüz, Herhangi bir sonuç bulamıyoruz", message: "Filminizi tür başlığı, kategorilere, yıllara göre bulun", messageImage: #imageLiteral(resourceName: "no-results"))
        
        if searching {
            return searchedData.count
        } else {
            return SearchVM.shared.searchMovie.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: searchCell, for: indexPath) as! SearchTableViewCell
        if searching {
            let item = searchedData[indexPath.row]
            cell.configureCell(item: item)
        } else {
            let item = SearchVM.shared.searchMovie[indexPath.row]
            cell.configureCell(item: item)
        }
        cell.frame = cell.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
        
    }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let vc = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailsViewController
            DetailVM.shared.movieID = SearchVM.shared.searchMovie[indexPath.row].id
            AboutViewController.detailAbout = SearchVM.shared.searchMovie[indexPath.row].overview
            navigationController?.pushViewController(vc, animated: true)
        }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        let contentHeight = self.tableview.contentSize.height-250
        let height = scrollView.frame.size.height
        
        if offsetY >= contentHeight - height {
            
            SearchVM.shared.getUpcoming{ errorMessage in
                if let errorMessage = errorMessage {
                    print("error \(errorMessage)")
                }
            }
        }
    }
    
}

extension SearchVC: SearchViewModelDelegate {
    func didGetUpcoming(isDone: Bool) {
        if isDone {
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
    }
}
