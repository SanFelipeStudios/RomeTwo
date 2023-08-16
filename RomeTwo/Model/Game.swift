//
//  Game.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 6/2/23.
//

import Foundation

// Adding Codable conformance makes it easier to move data between the structure and a data file
struct Game: Hashable, Codable, Identifiable {
    // UUID
    var id: String
    
    var title: String
    
    var summary: String
    
    var price: Double
    
    var hasInAppPurchases: Bool
    
    var releaseDate: String
    
    var developerId: String
    
    var publisherId: String
    
    // List of label Ids
    var labels: Array<String>
  
//    TODO: Figure out what is the best approach
//    // List of media Ids
//    var media: Array<String>
//
//    var media: Media
    
    
}

extension Game {
    static let gameOne = Game(id: "7E55F479-96B3-41A0-AF8C-F0F4A7B5E44D",
                              title: "gameOne",
                              summary: "summary",
                              price: 3.99,
                              hasInAppPurchases: false,
                              releaseDate: DateFormatter().string(from: Date.now),
                              developerId: "B940F51A-B86C-45FA-B2DA-08E0E75F51AA",
                              publisherId: "6DA682AC-C577-4A45-9D74-651A25C6D5DB",
                              labels: ["E73E0B56-9F08-4ED0-8A59-4C6926B3C47A", "5EF5AE98-7AC3-4CA7-9F02-59BEE4C216E0", "5C77B2CC-9A5C-428D-BB39-3A735AA9B16F"],
                              media: ["A9C245F1-8963-42A6-9B8A-71C12D91C206", "B8E09E5B-92E1-4C31-AD4F-67936E5476A2", "DC7B89EB-6A54-4D4D-97E9-3D4A3B8DB27F"])
    
    static let gameTwo = Game(id: "3A92FDBC-238B-4D12-B5DB-98FEA7FCA6E7",
                              title: "gameTwo",
                              summary: "summary",
                              price: 4.99,
                              hasInAppPurchases: true,
                              releaseDate: DateFormatter().string(from: Date.now),
                              developerId: "B940F51A-B86C-45FA-B2DA-08E0E75F51AA",
                              publisherId: "6DA682AC-C577-4A45-9D74-651A25C6D5DB",
                              labels: ["E73E0B56-9F08-4ED0-8A59-4C6926B3C47A", "5EF5AE98-7AC3-4CA7-9F02-59BEE4C216E0", "5C77B2CC-9A5C-428D-BB39-3A735AA9B16F"],
                              media: ["A9C245F1-8963-42A6-9B8A-71C12D91C206", "B8E09E5B-92E1-4C31-AD4F-67936E5476A2", "DC7B89EB-6A54-4D4D-97E9-3D4A3B8DB27F"])
    
    static let gameThree = Game(id: "A8D63A0F-7DF3-4FA4-97F1-46C6E8873A14",
                                title: "gameThree",
                                summary: "summary",
                                price: 5.99,
                                hasInAppPurchases: false,
                                releaseDate: DateFormatter().string(from: Date.now),
                                developerId: "B940F51A-B86C-45FA-B2DA-08E0E75F51AA",
                                publisherId: "6DA682AC-C577-4A45-9D74-651A25C6D5DB",
                                labels: ["E73E0B56-9F08-4ED0-8A59-4C6926B3C47A", "5EF5AE98-7AC3-4CA7-9F02-59BEE4C216E0", "5C77B2CC-9A5C-428D-BB39-3A735AA9B16F"],
                                media: ["A9C245F1-8963-42A6-9B8A-71C12D91C206", "B8E09E5B-92E1-4C31-AD4F-67936E5476A2", "DC7B89EB-6A54-4D4D-97E9-3D4A3B8DB27F"])
}
