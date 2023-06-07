//
//  Country.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 6/6/23.
//

import RealmSwift

final class Country: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    
    @Persisted var name: String
    
}
