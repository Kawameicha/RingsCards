//
//  CardsDecoder.swift
//  RingsCards
//
//  Created by Christoph Freier on 28.09.23.
//

import Foundation
import SwiftData

struct CardResponse: Decodable {
    var pack_code: String
    var pack_name: String
    var type_code: String
    var type_name: String
    var sphere_code: String
    var sphere_name: String
    var position: Int
    var code: String
    var name: String
    var traits: String? = nil
    var text: String? = nil
    var flavor: String? = nil
    var is_unique: Bool
    var threat: Int? = nil
    var cost: String? = nil
    var willpower: Int? = nil
    var attack: Int? = nil
    var defense: Int? = nil
    var health: Int? = nil
    var quantity: Int
    var deck_limit: Int
    var illustrator: String
    var octgnid: String
    var has_errata: Bool
    var url: String
    var imagesrc: String
}

struct CardJSONDecoder {
    static func decode(from fileName: String) -> [CardResponse] {

        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let cards = try? JSONDecoder().decode([CardResponse].self, from: data) else {
            return []
        }

        return cards
    }
}

extension CardResponse {
    static func fetchCards() async throws -> [CardResponse] {
        let url = URL(string: "https://www.ringsdb.com/api/public/cards/core")!

        let session = URLSession.shared
        guard let (data, response) = try? await session.data(from: url),
              let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200
        else {
            throw DownloadError.missingData
        }

        do {
            return try JSONDecoder().decode([CardResponse].self, from: data)
        } catch {
            throw DownloadError.wrongDataFormat(error: error)
        }
    }
}

enum DownloadError: Error {
    case wrongDataFormat(error: Error)
    case missingData
}

extension CardResponse {
    @MainActor
    static func refresh(modelContext: ModelContext) async {
        do {
            let cards = try await fetchCards()

            cards.forEach { item in
                let card = Card(pack_code: item.pack_code,
                                pack_name: item.pack_name,
                                type_code: item.type_code,
                                type_name: item.type_name,
                                sphere_code: item.sphere_code,
                                sphere_name: item.sphere_name,
                                position: item.position,
                                code: item.code,
                                name: item.name,
                                traits: item.traits,
                                text: item.text,
                                flavor: item.flavor,
                                is_unique: item.is_unique,
                                threat: item.threat,
                                cost: item.cost,
                                willpower: item.willpower,
                                attack: item.attack,
                                defense: item.defense,
                                health: item.health,
                                quantity: item.quantity,
                                deck_limit: item.deck_limit,
                                illustrator: item.illustrator,
                                octgnid: item.octgnid,
                                has_errata: item.has_errata,
                                url: item.url,
                                imagesrc: item.imagesrc)
                    modelContext.insert(card)
            }

        } catch {
            fatalError("Failed to fetch cards")
        }
    }
}
