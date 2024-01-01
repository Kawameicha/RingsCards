//
//  UserCollection.swift
//  RingsCards
//
//  Created by Christoph Freier on 31.12.23.
//

import Foundation
import SwiftData

@Model
final class UserCollection {
    var card: Card?
    var isInCollection: Bool = true

    init(card: Card? = nil, isInCollection: Bool?) {
        self.card = card ?? nil
        self.isInCollection = isInCollection ?? true
    }
}
