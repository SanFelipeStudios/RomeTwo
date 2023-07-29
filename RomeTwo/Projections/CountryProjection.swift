//
//  CountryProjection.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 7/13/23.
//

import Foundation
import RealmSwift

class CountryProjection: Projection<Country> {
    @Projected(\Country.id) var id
    @Projected(\Country.name) var name
}
