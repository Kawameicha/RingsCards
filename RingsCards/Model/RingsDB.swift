//
//  RingsDB.swift
//  RingsCards
//
//  Created by Christoph Freier on 20.08.23.
//

import Foundation
import Combine

final class RingsData: ObservableObject {
    @Published var cards: [Card] = load("PlayerCards.json")
    @Published var packs: [Pack] = load("AdventurePacks.json")
    @Published var user = User.default
//    @Published var packs: [Encounters] = load("EncounterCards.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
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
