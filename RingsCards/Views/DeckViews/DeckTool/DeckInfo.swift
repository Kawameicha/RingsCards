//
//  DeckInfo.swift
//  RingsCards
//
//  Created by Christoph Freier on 16.12.23.
//

import SwiftUI

struct DeckInfo: View {
    var count: Int = 0

    var body: some View {
        Text("^[\(count) deck](inflect: true)")
    }
}

#Preview {
    DeckInfo(count: 8)
}
