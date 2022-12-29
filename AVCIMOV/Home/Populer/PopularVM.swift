//
//  FavoriteCore.swift
//  AVCIMOV
//
//  Created by Anıl AVCI on 25.12.2022.
//
import Foundation

protocol PopularDelegate: AnyObject {
    func didGetPopular(isDone: Bool)
}

class PopularVM {
    
    weak var delegate: PopularDelegate?
    static let shared = PopularVM()
    private init () { }
    
    var popular: [ResultMovie] = []
    
    private var page: Int = 1
    
    func getPopular(complete: @escaping((String?)->())) {
        UpcomingManager.shared.getUpcoming(page: page) { items, errorMessage in
            
            if let items = items {
                self.popular.append(contentsOf: items.results!)
                self.page += 1
                self.delegate?.didGetPopular(isDone: true)
            }
            complete(errorMessage)
            self.delegate?.didGetPopular(isDone: false)
        }
    }
}
