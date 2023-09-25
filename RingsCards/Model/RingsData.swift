//
//  RingsData.swift
//  RingsCards
//
//  Created by Christoph Freier on 20.08.23.
//

import Foundation
import Combine

final class RingsData: ObservableObject {
    @Published var cards: [Card] = load("Cards.json")
    @Published var packs: [Pack] = load("Packs.json")
    @Published var scenarios: [Scenario] = load("Scenarios.json")
    @Published var user = User.default
    @Published var collection: [Collection] = [
        Collection(cycleName: "Shadows of Mirkwood", cycleCode: "Mirkwood", cyclePosition: 1, packName: "Core Set", PackCode: "Core", PackPosition: 1, isInCollection: true),
        Collection(cycleName: "Shadows of Mirkwood", cycleCode: "Mirkwood", cyclePosition: 1, packName: "Campaign Cards", PackCode: "RevCore", PackPosition: 8),
        Collection(cycleName: "Shadows of Mirkwood", cycleCode: "Mirkwood", cyclePosition: 1, packName: "The Hunt for Gollum", PackCode: "HfG", PackPosition: 2),
        Collection(cycleName: "Shadows of Mirkwood", cycleCode: "Mirkwood", cyclePosition: 1, packName: "Conflict at the Carrock", PackCode: "CatC", PackPosition: 3),
        Collection(cycleName: "Shadows of Mirkwood", cycleCode: "Mirkwood", cyclePosition: 1, packName: "A Journey to Rhosgobel", PackCode: "JtR", PackPosition: 4),
        Collection(cycleName: "Shadows of Mirkwood", cycleCode: "Mirkwood", cyclePosition: 1, packName: "The Hills of Emyn Muil", PackCode: "HoEM", PackPosition: 5),
        Collection(cycleName: "Shadows of Mirkwood", cycleCode: "Mirkwood", cyclePosition: 1, packName: "The Dead Marshes", PackCode: "TDM", PackPosition: 6),
        Collection(cycleName: "Shadows of Mirkwood", cycleCode: "Mirkwood", cyclePosition: 1, packName: "Return to Mirkwood", PackCode: "RtM", PackPosition: 7),
        Collection(cycleName: "Dwarrowdelf", cycleCode: "Dwarrowdelf", cyclePosition: 2, packName: "Khazad-dûm", PackCode: "KD", PackPosition: 1),
        Collection(cycleName: "Dwarrowdelf", cycleCode: "Dwarrowdelf", cyclePosition: 2, packName: "The Redhorn Gate", PackCode: "TRG", PackPosition: 2),
        Collection(cycleName: "Dwarrowdelf", cycleCode: "Dwarrowdelf", cyclePosition: 2, packName: "Road to Rivendell", PackCode: "RtR", PackPosition: 3),
        Collection(cycleName: "Dwarrowdelf", cycleCode: "Dwarrowdelf", cyclePosition: 2, packName: "The Watcher in the Water", PackCode: "WitW", PackPosition: 4),
        Collection(cycleName: "Dwarrowdelf", cycleCode: "Dwarrowdelf", cyclePosition: 2, packName: "The Long Dark", PackCode: "TLD", PackPosition: 5),
        Collection(cycleName: "Dwarrowdelf", cycleCode: "Dwarrowdelf", cyclePosition: 2, packName: "Foundations of Stone", PackCode: "FoS", PackPosition: 6),
        Collection(cycleName: "Dwarrowdelf", cycleCode: "Dwarrowdelf", cyclePosition: 2, packName: "Shadow and Flame", PackCode: "SaF", PackPosition: 7)
    ]
    @Published var spheres = [
        Sphere(name: "Leadership"),
        Sphere(name: "Tactics"),
        Sphere(name: "Spirit"),
        Sphere(name: "Lore"),
        Sphere(name: "Neutral"),
        Sphere(name: "Baggins"),
        Sphere(name: "Fellowship")
    ]
    @Published var campaigns = [Campaign]()
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
