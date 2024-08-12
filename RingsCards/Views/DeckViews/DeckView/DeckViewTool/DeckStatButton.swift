//
//  DeckStatButton.swift
//  RingsCards
//
//  Created by Christoph Freier on 08.08.24.
//

import SwiftUI

struct DeckStatButton: View {
    @Binding var showStat: Bool

    var body: some View {
        Button {
            showStat.toggle()
        } label: {
            Label("Show Chart", systemImage: "chart.bar.xaxis")
        }
    }
}


#Preview {
    DeckStatButton(showStat: .constant(true))
}
