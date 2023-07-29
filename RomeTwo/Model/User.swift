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
    
    @Persisted var addresses: List<Address>
    
    // List of Game Ids
    @Persisted var library: List<ObjectId>
    
    // List of Game Ids
    @Persisted var cart: List<ObjectId>
    
    // List of Game Ids
    @Persisted var wishlist: List<ObjectId>
    
//     TODO: Implement Objects
//    @Persisted var payment: List<Object>
    
}

final class Address: EmbeddedObject {
    @Persisted var isMailingAddress: Bool
    
    @Persisted var isBillingAddress: Bool
    
    @Persisted var addressLineOne: String
    
    @Persisted var addressLineTwo: String
    
    @Persisted var zipcode: Int
    
    @Persisted var city: String
    
    @Persisted var territory: Territory?
    
    @Persisted var country: Country?
}
