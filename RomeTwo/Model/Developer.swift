//
//  Developer.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 6/2/23.
//

import Foundation

struct Developer: Hashable, Codable, Identifiable {
    var id = UUID()
    
    var name: String
    
    var summary: String
    
    var games: Array<UUID>
    
}
