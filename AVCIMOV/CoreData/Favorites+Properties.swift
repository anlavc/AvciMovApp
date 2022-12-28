//
//  Favorites+Properties.swift
//  AVCIMOV
//
//  Created by Anıl AVCI on 25.12.2022.
//

import Foundation

import CoreData


extension Favorites {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorites> {
        return NSFetchRequest<Favorites>(entityName: "Favorites")
    }

    @NSManaged public var movieId: String?
    @NSManaged public var title: String?
    @NSManaged public var detail: String?
    @NSManaged public var image: String?
    @NSManaged public var origin: String?
    @NSManaged public var imdb: String?
    @NSManaged public var date: Date?
}

extension Favorites : Identifiable {

}
