//
//  Rating.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 6/2/23.
//

import Foundation

struct Review: Hashable, Codable, Identifiable {
    // UUID
    var id: String
    
    // User Id
    var userId: String
    
    // Game Id
    var gameId: String
    
    var title: String
    
    var summary: String
    
    var recommend: Bool
    
}
