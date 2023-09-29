//
//  CardInfo.swift
//  RingsCards
//
//  Created by Christoph Freier on 29.09.23.
//

import SwiftUI

struct CardInfo: View {
    @Environment(ViewModel.self) private var viewModel

    var count: Int = 0

    var body: some View {
        @Bindable var viewModel = viewModel

        HStack {
            VStack {
                Text("\(count) cards")
            }
        }
    }
}

#Preview {
    CardInfo(count: 8)
        .environment(ViewModel())
}
