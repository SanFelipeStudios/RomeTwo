//
//  ModelData.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 8/12/23.
//

import Foundation

import Combine

final class ModelData: ObservableObject {
    @Published var games: [Game] = load("gameData.json")
    @Published var developers: [Developer] = load("developerData.json")
    @Published var publishers: [Publisher] = load("publisherData.json")
    @Published var labels: [Label] = load("labelData.json")
    @Published var reviews: [Review] = load("reviewData.json")
}

func load<T: Decodable>(_ filename: String) -> T {

    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
