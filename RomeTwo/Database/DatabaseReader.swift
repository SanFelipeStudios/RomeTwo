//
//  DatabaseReader.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 7/3/23.
//

import Foundation
import Realm
import RealmSwift
import SwiftUI

// Don't lock to read:
//    Realm's Multiversion Concurrency Control (MVCC) architecture eliminates the need to lock for read operations.
//    The values you read will never be corrupted or in a partially-modified state.
//    You can freely read from the same Realm file on any thread without the need for locks or mutexes.
//    Unnecessarily locking would be a performance bottleneck since each thread might need to wait its turn before reading.

class DatabaseReader {
    // Open the default realm
    var realm: Realm!
    
    @MainActor
    init() async throws {
        realm = try await Realm()
    }
    
    func readManyByType<T: RealmSwift.Object>(of object: T) async throws -> Results<T> {
        return realm.objects(T.self)
    }
    
    func readById() async throws {
        
    }
}
