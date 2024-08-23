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
    var imagesrc: String? = nil
}

extension CardResponse {
    var cardSort: Int {
        switch type_code {
        case "hero":
            return 1
        case "ally":
            return 2
        case "attachment":
            return 3
        case "event":
            return 4
        case "player-side-quest":
            return 5
        case "contract":
            return 6
        case "treasure":
            return 7
        default:
            return 8
        }
    }
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
    static func refresh(modelContext: ModelContext) async {
        do {
            let cards = try await fetchCards()

            cards.forEach { card in
                let card = Card(packCode: card.pack_code,
                                packName: card.pack_name,
                                typeCode: card.type_code,
                                typeName: card.type_name,
                                sphereCode: card.sphere_code,
                                sphereName: card.sphere_name,
                                position: card.position,
                                code: card.code,
                                name: card.name,
                                isUnique: card.is_unique,
                                quantity: card.quantity,
                                deckLimit: card.deck_limit,
                                cardSort: card.cardSort,
                                costs: CardCost(cost: card.cost,
                                                threat: card.threat),
                                stats: CardStat(willpower: card.willpower,
                                                attack: card.attack,
                                                defense: card.defense,
                                                health: card.health,
                                                quest: card.quest,
                                                victory: card.victory),
                                texts: CardText(traits: card.traits,
                                                text: card.text,
                                                flavor: card.flavor,
                                                illustrator: card.illustrator,
                                                hasErrata: card.has_errata,
                                                url: card.url,
                                                imagesrc: card.imagesrc))

                modelContext.insert(card)
            }
        } catch {
            print("Failed to fetch cards")
        }
    }
}
