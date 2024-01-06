//
//  ScenarioViewMark.swift
//  RingsCards
//
//  Created by Christoph Freier on 21.08.23.
//

import SwiftUI

struct ScenarioViewMark: View {
    @Binding var isSet: Bool

    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Completed", systemImage: isSet ? "checkmark.square" : "square")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .green : .gray)
        }
    }
}

#Preview {
    ScenarioViewMark(isSet: .constant(true))
}
