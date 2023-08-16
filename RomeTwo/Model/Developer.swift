//
//  Developer.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 6/2/23.
//

import Foundation

struct Developer: Hashable, Codable, Identifiable {
    var id: String
    
    var name: String
    
    var summary: String
    
    // List of Game Ids
    var games: Array<String>
    
}
