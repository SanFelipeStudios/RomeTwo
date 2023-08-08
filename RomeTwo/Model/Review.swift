//
//  Rating.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 6/2/23.
//

import RealmSwift

final class Review: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    
    @Persisted var userId: ObjectId
    
    @Persisted var gameId: ObjectId
    
    @Persisted var title: String
    
    @Persisted var summary: String
    
    @Persisted var recommend: Bool
    
}
