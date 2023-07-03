//
//  Database.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 6/10/23.
//

import Foundation
import Realm
import RealmSwift
import SwiftUI

actor DatabaseActor {
    // Open the default realm
    var realm: Realm!
    init() async throws {
        realm = try await Realm(actor: self)
    }

    // When `update` is:
    // - .modified: update the fields that have changed.
    // - .all: replace all of the fields regardless of
    //   whether they've changed.
    // - .error: throw an exception if a key with the same
    //   primary key already exists.
    func insertManyMayExist<T: RealmSwiftObject>(objects: [T]) async throws {
        for object in objects {
            try await realm.asyncWrite {
                realm.create(type(of: object), value: object, update: .modified)
            }
        }
    }
    
    func insertManyUnique<T: RealmSwift.Object>(objects: [T]) async throws {
        for object in objects {
            try await realm.asyncWrite {
                realm.create(type(of: object), value: object, update: .error)
            }
        }
    }
    
    func deleteMany<T: RealmSwift.Object>(objects: [T]) async throws {
        for object in objects {
            try await realm.asyncWrite {
                realm.delete(object)
            }
        }
    }
    
// ------------------------------------------------------------------------------------------------------
// TODO: Determine if the following code is needed
// NOTE: The following code has NOT been tested or verified.
//       We are keeping this in case we need an alternative approach to async reads / writes
    
//    // Insert or update an object even if it exists
//    func insertOneMayExist(object: Object) async {
//        // Prepare to handle exceptions.
//        do {
//            // Open a thread-safe transaction.
//            try realm.write {
//                // Make any writes within this code block.
//                // Realm automatically cancels the transaction
//                // if this code throws an exception. Otherwise,
//                // Realm automatically commits the transaction
//                // after the end of this code block.
//                //
//                // When `update` is:
//                // - .modified: update the fields that have changed.
//                // - .all: replace all of the fields regardless of
//                //   whether they've changed.
//                // - .error: throw an exception if a key with the same
//                //   primary key already exists.
//                realm.add(object, update: .modified)
//            }
//        } catch let error as NSError {
//            // Failed to write to realm.
//            // ... Handle error ...
//            let _ = print("\(#function) | Failed to insert object: \(String(describing: object)).\n\(error)")
//        }
//    }
//
//    // Insert or update an array of objects even if they exist
//    func insertManyMayExist(objects: [Object]) async {
//        do {
//            try realm.write {
//                realm.add(objects, update: .modified)
//            }
//        } catch let error as NSError {
//            // Failed to write to realm.
//            // ... Handle error ...
//            for object in objects {
//                let _ = print("\(#function) | Failed to insert object: \(String(describing: object)).\n\(error)")
//            }
//        }
//    }
//
//    // Insert an object only if it is unique (id does not exist)
//    func insertOneUnique(object: Object) async {
//        do {
//            try realm.write {
//                realm.add(object, update: .error)
//            }
//        } catch let error as NSError {
//            // Failed to write to realm.
//            // ... Handle error ...
//            let _ = print("\(#function) | Failed to insert object: \(String(describing: object)).\n\(error)")
//        }
//    }
//
//    // Insert an array of objects only if they are unique  (id does not exist)
//    func insertManyUnique(objects: [Object]) async {
//        do {
//            try realm.write {
//                realm.add(objects, update: .error)
//            }
//        } catch let error as NSError {
//            // Failed to write to realm.
//            // ... Handle error ...
//            for object in objects {
//                let _ = print("\(#function) | Failed to insert object: \(String(describing: object)).\n\(error)")
//            }
//        }
//    }
// ------------------------------------------------------------------------------------------------------
    
}
