//
//  Rating.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 6/2/23.
//

import RealmSwift

final class Rating: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    
    @Persisted var title: String
    
    @Persisted var detail: String
    
    @Persisted var recommend: Bool
    
    @Persisted(originProperty: "ratings") var game: LinkingObjects<Game>
}
