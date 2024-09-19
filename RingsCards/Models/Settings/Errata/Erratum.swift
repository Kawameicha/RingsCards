//
//  Erratum.swift
//  RingsCards
//
//  Created by Christoph Freier on 13.02.24.
//

import Foundation
import SwiftData

@Model
class Erratum: Identifiable {
    @Attribute(.unique) var id: String
    var code: String
    var isOfficial: Bool
    var text: String

    init(id: String, code: String, isOfficial: Bool, text: String) {
        self.id = id
        self.code = code
        self.isOfficial = isOfficial
        self.text = text
    }
}
