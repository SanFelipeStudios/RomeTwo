//
//  User.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 6/1/23.
//

import Foundation

struct User {
    var id = UUID()
    
    var username: String
    
    var firstName: String
    
    var lastName: String
    
    var email: String
    
    var phone: String
    
    var addresses: Array<Address>
    
    // List of Game Ids
    var library: Array<UUID>
    
    // List of Game Ids
    var cart: Array<UUID>
    
    // List of Game Ids
    var wishlist: Array<UUID>
    
//     TODO: Implement Objects
//    @Persisted var payment: List<Object>
    
}

struct Address {
    var isMailingAddress: Bool
    
    var isBillingAddress: Bool
    
    var addressLineOne: String
    
    var addressLineTwo: String
    
    var zipcode: Int
    
    var city: String
    
    var territory: Territory
    
    var country: Country
}
