//
//  Media.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 6/2/23.
//
import RealmSwift

final class Media: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    
    @Persisted var name: String
    
    @Persisted var type: String
    
    @Persisted var url: String
}
