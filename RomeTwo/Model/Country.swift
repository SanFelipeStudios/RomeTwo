//
//  Country.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 6/6/23.
//

import RealmSwift
import Foundation

final class Country: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: Int
    
    @Persisted var name: String
}
