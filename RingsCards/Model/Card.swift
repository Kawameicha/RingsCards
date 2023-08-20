//
//  Card.swift
//  RingsCards
//
//  Created by Christoph Freier on 20.08.23.
//

import Foundation

struct Card: Hashable, Codable, Identifiable {
    let id = UUID()
    var pack_code: String
    var pack_name: String
    var type_code: String
    var type_name: String
    var sphere_code: String
    var sphere_name: String
    var position: Int
    var code: String
    var name: String
    var traits: String
    var text: String
    var flavor: String
    var is_unique: Bool
    var threat: Int
    var willpower: Int
    var attack: Int
    var defense: Int
    var health: Int
    var quantity: Int
    var deck_limit: Int
    var illustrator: String
    var octgnid: String
    var has_errata: Bool
    var url: String
    var imagesrc: String
}
