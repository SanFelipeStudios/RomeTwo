//
//  Developer.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 6/2/23.
//

import RealmSwift

final class Developer: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    
    @Persisted var name: String
    
    @Persisted var games: List<Game>
    
}
