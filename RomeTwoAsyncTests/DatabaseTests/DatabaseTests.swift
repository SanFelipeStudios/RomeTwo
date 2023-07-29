//
//  DatabaseTests.swift
//  RomeTwoAsyncTests
//
//  Created by Nicholas Rillera on 7/13/23.
//

import XCTest
import RealmSwift
@testable import RomeTwo

final class DatabaseTests: XCTestCase {
    
    override func setUp() {
    }
    
    
    func testDatabaseInsertNewUser() async {
        // Given
        guard let realm = try? await Realm() else {
            return print("error in realm")
        }
        
        // Create a Realm object, populat it with value
        let addresses = List<Address>()
        
        var mailAddr = false
        var billAddr = false
        var addOne = "555 West Ave"
        var addTwo = "Unit 999"
        var zipcode = 75039
        var city = "Austin"
        var territory: Territory? = nil
        var country: Country? = nil
        
        let address = Address(value: ["isMailingAddress": mailAddr,
                                      "isBillingAddress": billAddr,
                                      "addressLineOne": addOne,
                                      "addressLineTwo": addTwo,
                                      "zipcode": zipcode,
                                      "city": city,
                                      "territory": territory,
                                      "country": country
                                     ])
        addresses.append(address)
        let users = List<RomeTwo.User>()
        
        var id = UUID()
        var username = "username"
        var firstName = "firstName"
        var lastName = "lastName"
        var email = "email"
        var phone = "555-555-5555"
        
        var library = [ObjectId]()
        var cart = [ObjectId]()
        var wishlist = [ObjectId]()
        
        let bobby = User(value: ["_id": id,
                                 "username": username,
                                 "firstName": firstName,
                                 "lastName": lastName,
                                 "email": email,
                                 "phone": phone,
                                 "library": library,
                                 "cart": cart,
                                 "wishlist": wishlist,
                                "addresses": addresses])
        users.append(bobby)
        
        guard let sut = try? await DatabaseActor() else {
            return print("error from first sut")
        }
        
        // When
        try! await sut.insertMayExist(object: bobby)
        
        // Then
        
        // Retrieve all class projections of the given type `PersonProjection`
        // and filter for the first class projection where the `firstName` property
        // value is "Jason"
        let user = realm.objects(UserProjection.self).first(where: { $0.firstName == "Bobby" })!
        
        // Verify that we have the correct PersonProjection
        XCTAssert(user.firstName == "Bobby")
        
        // See that `homeCity` exists as a projection property
        // Although it is not on the object model
        XCTAssert(user.city == "Austin")
    }
    
    
}
