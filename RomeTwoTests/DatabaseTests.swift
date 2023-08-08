//
//  DatabaseTests.swift
//  RomeTwoTests
//
//  Created by Nicholas Rillera on 7/29/23.
//

import XCTest
import RealmSwift
@testable import RomeTwo

final class DatabaseTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Use an in-memory Realm identified by the name of the current test.
        // This ensures that each test can't accidentally access or modify the data
        // from other tests or the application itself, and because they're in-memory,
        // there's nothing that needs to be cleaned up.
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testInsertCountry() async throws {
        
        // Given
        let realm = try await Realm()
        let country = Country(value: ["_id": 123, "name": "Canada"])
        let sut = try await DatabaseActor()

        // When
        await sut.insertCountry(country: country)

        // Then
        print("hello world")
    }

}
