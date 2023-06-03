//
//  Curation.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 6/1/23.
//

import RealmSwift

final class Curation: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    
    @Persisted var gameID: ObjectId
    
    @Persisted var heading: String
    
    @Persisted var title: String
    
    @Persisted var subheading: String
    
    @Persisted var body: String
}


