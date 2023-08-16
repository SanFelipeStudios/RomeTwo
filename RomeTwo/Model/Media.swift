//
//  Media.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 6/2/23.
//

import Foundation

struct Media: Hashable, Codable, Identifiable {
    // UUID
    var id: String
    
    var name: String
    
    var type: String
    
    var url: String
}

//struct Media2 {
//    var id: String
//    
//    var headerImg: String
//    
//    var iconImg: String
//    
//    var headerVideo: String
//    
//    var videos: String
//    
//    var images:  String
//    
//    var gameId: String
//}
