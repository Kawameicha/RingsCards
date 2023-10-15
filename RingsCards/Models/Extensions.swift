//
//  Extensions.swift
//  RingsCards
//
//  Created by Christoph Freier on 29.09.23.
//

import SwiftUI

extension String {
    func within(_ strings: [String]) -> Bool {
        strings.contains { elementsEqual($0) }
    }
}

//extension String {
//    func cleaned() -> Self {
//        return self.folding(options: .diacriticInsensitive, locale: .current)
//    }
//}
