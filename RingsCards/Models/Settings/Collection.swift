//
//  Collection.swift
//  RingsCards
//
//  Created by Christoph Freier on 29.08.23.
//

import Foundation

struct Collection: Hashable, Identifiable {
    let id = UUID()
    let cycleName: String
    let cycleCode: String
    let cyclePosition: Int
    let packName: String
    let PackCode: String
    let PackPosition: Int
    var isInCollection = false
}
