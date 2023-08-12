//
//  Game.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 6/2/23.
//

import Foundation

// Adding Codable conformance makes it easier to move data between the structure and a data file
struct Game: Hashable, Codable, Identifiable {
    var id = UUID()
    
    var title: String
    
    var summary: String
    
    var price: Double
    
    var hasInAppPurchases: Bool
    
    var releaseDate: Date
    
    var developerId: UUID
    
    var publisherId: UUID
    
    // List of label ids
    var labels: Array<UUID>
    
    // List of media ids
    var media: Array<UUID>
    
}

extension Game {
    static let gameOne = Game(title: "gameOne", summary: "summary", price: 3.99, hasInAppPurchases: false, releaseDate: Date.now, developerId: UUID(), publisherId: UUID(), labels: Array(), media: Array())
    static let gameTwo = Game(title: "gameTwo", summary: "summary", price: 4.99, hasInAppPurchases: true, releaseDate: Date.now, developerId: UUID(), publisherId: UUID(), labels: Array(), media: Array())
    static let gameThree = Game(title: "gameThree", summary: "summary", price: 5.99, hasInAppPurchases: false, releaseDate: Date.now, developerId: UUID(), publisherId: UUID(), labels: Array(), media: Array())
}
