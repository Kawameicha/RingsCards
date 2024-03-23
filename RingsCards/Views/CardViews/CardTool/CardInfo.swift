//
//  CardInfo.swift
//  RingsCards
//
//  Created by Christoph Freier on 29.09.23.
//

import SwiftUI
import SwiftData

struct CardInfo: View {
    var count: Int = 0

    var body: some View {
        if count <= 1 {
            Text("\(count) card")
        } else {
            Text("\(count) cards")
        }
    }
}

#Preview {
    CardInfo()
}
