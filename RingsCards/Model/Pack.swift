//
//  Pack.swift
//  RingsCards
//
//  Created by Christoph Freier on 21.08.23.
//

import Foundation

struct Pack: Hashable, Codable, Identifiable {
    var inCollection: Bool
    var name: String
    var code: String
    var position: Int
    var cycle_position: Int
    var available: String
    var known: Int
    var total: Int
    var url: String
    var id: Int
}
