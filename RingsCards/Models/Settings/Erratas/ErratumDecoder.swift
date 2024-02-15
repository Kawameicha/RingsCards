//
//  ErratumDecoder.swift
//  RingsCards
//
//  Created by Christoph Freier on 13.02.24.
//

import Foundation
import SwiftData

struct ErratumResponse: Decodable {
    var id: String
    var code: String
    var isOfficial: Bool
    var text: String
}

struct ErratumJSONDecoder {
    static func decode(from fileName: String) -> [ErratumResponse] {

        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let errata = try? JSONDecoder().decode([ErratumResponse].self, from: data) else {
            return []
        }

        return errata
    }
}
