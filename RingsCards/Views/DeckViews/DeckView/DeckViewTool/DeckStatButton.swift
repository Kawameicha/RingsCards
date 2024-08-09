//
//  DeckChartButton.swift
//  RingsCards
//
//  Created by Christoph Freier on 08.08.24.
//

import SwiftUI

struct DeckChartButton: View {
    @Binding var showstat: Bool

    var body: some View {
        Button {
            showstat.toggle()
        } label: {
            Label("Show Chart", systemImage: "chart.bar.xaxis")
        }
    }
}


#Preview {
    DeckChartButton(showstat: .constant(true))
}
