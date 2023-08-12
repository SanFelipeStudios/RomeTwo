//
//  Rating.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 6/2/23.
//

import Foundation

struct Review: Hashable, Codable, Identifiable {
    var id = UUID()
    
    var userId: UUID
    
    var gameId: UUID
    
    var title: String
    
    var summary: String
    
    var recommend: Bool
    
}
