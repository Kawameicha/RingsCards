//
//  Erratum.swift
//  RingsCards
//
//  Created by Christoph Freier on 13.02.24.
//

import Foundation
import SwiftData

@Model
class Erratum {
    @Attribute(.unique) let id: String
    let code: String
    let isOfficial: Bool
    let text: String

    init(id: String, code: String, isOfficial: Bool, text: String) {
        self.id = id
        self.code = code
        self.isOfficial = isOfficial
        self.text = text
    }
}
