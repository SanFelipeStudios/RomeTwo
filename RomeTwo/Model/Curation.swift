//
//  Curation.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 6/1/23.
//

import Foundation

struct Curation: Hashable, Codable, Identifiable {
    // UUID
    var id: String
    
    // UUID
    var gameId: String
    
    var heading: String
    
    var title: String
    
    var subheading: String
    
    var summary: String
}


