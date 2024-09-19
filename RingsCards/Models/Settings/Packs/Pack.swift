//
//  Pack.swift
//  RingsCards
//
//  Created by Christoph Freier on 29.08.23.
//

import Foundation
import SwiftData

@Model
class Pack: Identifiable {
    @Attribute(.unique) var id: String
    var packName: String
    var packCode: String
    var packSort: Int
    var cycleName: String
    var cycleCode: String
    var cycleSort: Int
    var isCycle: Bool
    var isInCollection = false

    init(id: String, packName: String, packCode: String, packSort: Int, cycleName: String, cycleCode: String, cycleSort: Int, isCycle: Bool, isInCollection: Bool = false) {
        self.id = id
        self.packName = packName
        self.packCode = packCode
        self.packSort = packSort
        self.cycleName = cycleName
        self.cycleCode = cycleCode
        self.cycleSort = cycleSort
        self.isCycle = isCycle
        self.isInCollection = isInCollection
    }
}
