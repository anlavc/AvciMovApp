//
//  APIURLs.swift
//  MVVM-Example
//
//  Created by Fatih Kilit on 9.10.2022.
//

import Foundation

enum APIURLs {
    static func movies(page: Int) -> String {
        "https://api.themoviedb.org/3/movie/popular?api_key=2c63cbfe763893ff6028520a3d316d11&language=en-US&page=\(page)"
    }
    
    static func imageURL(posterPath: String) -> String {
        "https://image.tmdb.org/t/p/w500\(posterPath)"
    }
    
    static func detail(id: Int) -> String {
        "https://api.themoviedb.org/3/movie/\(id)?api_key=2c63cbfe763893ff6028520a3d316d11&language=en-US"
       
    }
}
