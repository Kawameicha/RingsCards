//
//  Rule.swift
//  RingsCards
//
//  Created by Christoph Freier on 11.02.24.
//

import Foundation
import SwiftData

@Model
class Rule: Identifiable {
    @Attribute(.unique) var id: String
    var name: String
    var isKeyword: Bool
    var text: String
    var seeAlso: [SeeAlso]

    init(id: String, name: String, isKeyword: Bool, text: String, seeAlso: [SeeAlso]) {
        self.id = id
        self.name = name
        self.isKeyword = isKeyword
        self.text = text
        self.seeAlso = seeAlso
    }
}

struct SeeAlso: Hashable, Codable, Identifiable {
    let id: String
    let name: String
}

extension Rule {
    static func predicate(
        keywordOnly: Bool,
        searchText: String,
        filterRule: [String]
    ) -> Predicate<Rule> {

        return #Predicate<Rule> { rule in
            if keywordOnly {
                (filterRule.isEmpty || filterRule.contains(rule.id))
                &&
                (rule.isKeyword)
                &&
                (searchText.isEmpty || rule.name.localizedStandardContains(searchText))
            } else {
                (filterRule.isEmpty || filterRule.contains(rule.id))
                &&
                (!rule.isKeyword)
                &&
                (searchText.isEmpty || rule.name.localizedStandardContains(searchText))
            }
        }
    }
}
