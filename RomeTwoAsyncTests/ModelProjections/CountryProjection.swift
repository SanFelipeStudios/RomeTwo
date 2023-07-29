//
//  CountryProjection.swift
//  RomeTwoAsyncTests
//
//  Created by Nicholas Rillera on 7/13/23.
//

import Foundation
@testable import RomeTwo

class CountryProjection: Projection<Country> {
    @Projected(\Country.)
}
