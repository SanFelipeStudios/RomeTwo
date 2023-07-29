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
    
    @Persisted var summary: String
    
    @Persisted var price: Double
    
    @Persisted var hasInAppPurchases: Bool
    
    @Persisted var releaseDate: Date?
    
    @Persisted var developerId: ObjectId
    
    @Persisted var publisherId: ObjectId
    
    // List of label ids
    @Persisted var labels: List<ObjectId>
    
    // List of media ids
    @Persisted var media: List<Media>
    
}
