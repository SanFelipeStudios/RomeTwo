//
//  Game.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 6/2/23.
//



//Game
//
//    id: UUID
//    Title: String
//    Description: [String]
//    DeveloperId: UUID (inverse)
//    PublisherId: UUID (inverse)
//    Price: Double
//    hasInAppPurchases: Boolean
//    Release Date: String
//    Labels: [UUID]
//    Ratings: [UUID] (linking)
//    Media: [Integer: UUID] (linking)
import Foundation
import RealmSwift

final class Game: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    
    @Persisted var title: String
    
    @Persisted var details: String
    
    @Persisted var price: Double
    
    @Persisted var hasInAppPurchases: Bool
    
    @Persisted var releaseDate: Date
    
    // List of label ids
    @Persisted var labels: List<ObjectId>
    
    // List of rating ids
    @Persisted var ratings: List<Rating>
    
    // List of media ids
    @Persisted var media: List<Media>

    // Game belongs to a developer
    @Persisted(originProperty: "games") var developerId: LinkingObjects<Developer>
    
    // Game belongs to a publisher
    @Persisted(originProperty: "games") var publisherId: LinkingObjects<Publisher>
    
}
