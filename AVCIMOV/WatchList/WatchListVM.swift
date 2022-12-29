//
//  FavoriteCore.swift
//  AVCIMOV
//
//  Created by Anıl AVCI on 25.12.2022.
//

import Foundation

protocol WatchListViewModelDelegate: AnyObject {
    func didGetMovies(isDone: Bool)
}


class WatchListVM {
    
    static let shared = WatchListVM()
    weak var delegate: WatchListViewModelDelegate?
    private init () { }
    
    var favoritesArray = [Favorites]()
    let coreDataHelper = CoreDataHelper()
    
    func fetchData() {
    favoritesArray = coreDataHelper.fetchData() ?? [Favorites]()
    }
}
