//
//  User.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 6/1/23.
//

import RealmSwift

final class User: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    
    @Persisted var username: String
    
    @Persisted var firstName: String
    
    @Persisted var lastName: String
    
    @Persisted var email: String
    
    @Persisted var phone: String
    
    // TODO: Implement Objects
//    @Persisted var cart: Object
//
//    @Persisted var address: Object
    
    // List of Game Ids
    @Persisted var library: List<ObjectId>
    
    // List of Game Ids
    @Persisted var wishlist: List<ObjectId>
    
//    // TODO: List of Payments
//    @Persisted var payment: List<Object>
    
    
    
}

