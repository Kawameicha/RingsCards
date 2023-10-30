//
//  Pack.swift
//  RingsCards
//
//  Created by Christoph Freier on 29.08.23.
//

import Foundation
import SwiftData

@Model
class Pack {
    let cycleName: String
    let cycleCode: String
    let cyclePosition: Int
    let packName: String
    @Attribute(.unique) let packCode: String
    let packPosition: Int
    var isInCollection = false

    init(cycleName: String, cycleCode: String, cyclePosition: Int, packName: String, packCode: String, packPosition: Int, isInCollection: Bool = false) {
        self.cycleName = cycleName
        self.cycleCode = cycleCode
        self.cyclePosition = cyclePosition
        self.packName = packName
        self.packCode = packCode
        self.packPosition = packPosition
        self.isInCollection = isInCollection
    }
}
