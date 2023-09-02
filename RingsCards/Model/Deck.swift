//
//  Deck.swift
//  RingsCards
//
//  Created by Christoph Freier on 27.08.23.
//

import Foundation

struct Deck: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var date_creation: String
    var date_update: String
    var description_md: String
    var user_id: Int
    var heroes: [String: Int]
    var slots: [String: Int]
    var sideslots: [String: Int]
    var version: String
    var last_pack: String
    var freeze_comments: String?
    var is_published: Bool
    var nb_votes: Int
    var nb_favorites: Int
    var nb_comments: Int
    var starting_threat: Int
}
