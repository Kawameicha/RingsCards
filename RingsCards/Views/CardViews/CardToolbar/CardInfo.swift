//
//  CardInfo.swift
//  RingsCards
//
//  Created by Christoph Freier on 29.09.23.
//

import SwiftUI

struct CardInfo: View {
    @Environment(ViewCardModel.self) private var viewCardModel

    var count: Int = 0

    var body: some View {
        @Bindable var viewCardModel = viewCardModel

        HStack {
            if count <= 1 {
                Text("\(count) card")
            } else {
                Text("\(count) cards")
            }
        }
    }
}

#Preview {
    CardInfo(count: 8)
        .environment(ViewCardModel())
}
