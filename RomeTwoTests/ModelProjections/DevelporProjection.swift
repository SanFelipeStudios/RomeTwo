//
//  DevelporProjection.swift
//  RomeTwoTests
//
//  Created by Nicholas Rillera on 7/4/23.
//

import Foundation
import RealmSwift
import Model.Developer

//final class Developer: Object, ObjectKeyIdentifiable {
//    @Persisted(primaryKey: true) var _id: ObjectId
//
//    @Persisted var name: String
//
//    @Persisted var summary: String?
//
//    @Persisted var games: List<ObjectId>
//

class DeveloperProjection: Projection<Developer> {
    @Projected(\Developer.id) var _id // Passthrough from original object
    @Projected(\Developer.name) var name
    @Projected(\Developer.summary?) var summary?: ProjectedCollection<String> 
    @Projected(\Developer.games var games: ProjectedCollection<ObjectId>) // Collection mapping
}
