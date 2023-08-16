//
//  Label.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 6/2/23.
//

import Foundation

struct Label: Hashable, Codable, Identifiable {
    // UUID
    var id: String
    
    var name: String
    
    var summary: String
    
    // List of Game Ids
    var games: Array<String>
    
}
