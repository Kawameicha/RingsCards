//
//  PackDecoder.swift
//  RingsCards
//
//  Created by Christoph Freier on 21.02.24.
//

import Foundation
import SwiftData

struct PackResponse: Decodable {
    var id: String
    var packName: String
    var packCode: String
    var packSort: Int
    var cycleName: String
    var cycleCode: String
    var cycleSort: Int
    var isCycle: Bool
}

struct PackJSONDecoder {
    static func decode(from fileName: String) -> [PackResponse] {

        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let packs = try? JSONDecoder().decode([PackResponse].self, from: data) else {
            return []
        }

        return packs
    }
}
