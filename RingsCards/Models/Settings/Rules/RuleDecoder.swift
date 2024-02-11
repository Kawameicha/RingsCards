//
//  RuleDecoder.swift
//  RingsCards
//
//  Created by Christoph Freier on 11.02.24.
//

import Foundation
import SwiftData

struct RuleResponse: Decodable {
    var id: String
    var name: String
    var text: String
    var seeAlso: [SeeAlso]
}

struct RuleJSONDecoder {
    static func decode(from fileName: String) -> [RuleResponse] {

        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let rules = try? JSONDecoder().decode([RuleResponse].self, from: data) else {
            return []
        }

        return rules
    }
}
