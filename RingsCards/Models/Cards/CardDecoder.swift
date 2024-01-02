//
//  CardDecoder.swift
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
    var victory: Int? = nil
    var quest: Int? = nil
    var willpower: Int? = nil
    var attack: Int? = nil
    var defense: Int? = nil
    var health: Int? = nil
    var quantity: Int
    var deck_limit: Int
    var illustrator: String? = nil
    var octgnid: String? = nil
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
        let url = URL(string: "https://www.ringsdb.com/api/public/cards/")!
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
    static func refresh(modelContext: ModelContext, packs: [Pack]) async {
        do {
            let cards = try await fetchCards()

            cards.forEach { card in
                let card = Card(pack_code: card.pack_code,
                                pack_name: card.pack_name,
                                type_code: card.type_code,
                                type_name: card.type_name,
                                sphere_code: card.sphere_code,
                                sphere_name: card.sphere_name,
                                position: card.position,
                                code: card.code,
                                name: card.name,
                                traits: card.traits,
                                text: card.text,
                                flavor: card.flavor,
                                is_unique: card.is_unique,
                                threat: card.threat,
                                cost: card.cost,
                                victory: card.victory,
                                quest: card.quest,
                                willpower: card.willpower,
                                attack: card.attack,
                                defense: card.defense,
                                health: card.health,
                                quantity: card.quantity,
                                deck_limit: card.deck_limit,
                                illustrator: card.illustrator,
                                octgnid: card.octgnid,
                                has_errata: card.has_errata,
                                url: card.url,
                                imagesrc: card.imagesrc)

                // MARK: this only to used together with UserCollection
                // if packs.map({ $0.packCode }).contains(card.pack_code) {
                //    _ = UserCollection(card: card, isInCollection: card.userCollection?.isInCollection ?? true) }
                    modelContext.insert(card)
            }

        } catch {
            fatalError("Failed to fetch cards")
        }
    }
}
