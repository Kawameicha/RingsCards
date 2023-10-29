//
//  Keyword.swift
//  RingsCards
//
//  Created by Christoph Freier on 29.10.23.
//

import Foundation
import SwiftData

@Model
class Keyword {
    let id: Int
    let code: String
    let name: String
    let text: String
    
    init(id: Int, code: String, name: String, text: String) {
        self.id = id
        self.code = code
        self.name = name
        self.text = text
    }
}

extension Keyword {
    static func predicate(
        filterScenario: [String]
    ) -> Predicate<Keyword> {

        return #Predicate<Keyword> { keyword in
            (filterScenario.contains(keyword.name))
        }
    }
}
