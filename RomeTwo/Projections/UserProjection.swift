//
//  UserProjection.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 7/13/23.
//

import Foundation
import Realm
import RealmSwift

//When you define a class projection, you can transform the original @Persisted property in several ways:
//
//    Passthrough: the property is the same name and type as the original object
//
//    Rename: the property has the same type as the original object, but a different name
//
//    Keypath resolution: use keypath resolution to access properties of the original object, including embedded object properties
//
//    Collection mapping: Project lists or mutable sets of Object s or EmbeddedObject s as a collection of primitive values
//
//    Exclusion: when you use a class projection, the underlying object's properties that are not @Projected through the class projection are excluded. This enables you to watch for changes to a class projection and not see changes for properties that are not part of the class projection.

class UserProjection: Projection<User> {
    @Projected(\User.firstName) var firstName // Passthrough from original object
    @Projected(\User.addresses[0].city) var city
//    @Projected(\User.addresses.projectTo.city) var city: ProjectedCollection<String> // Collection mapping
}
