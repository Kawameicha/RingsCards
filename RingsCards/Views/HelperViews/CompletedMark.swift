//
//  CompletedMark.swift
//  RingsCards
//
//  Created by Christoph Freier on 21.08.23.
//

import SwiftUI

struct CompletedMark: View {
    @Binding var isSet: Bool

    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Completed", systemImage: isSet ? "checkmark.circle" : "circle")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .green : .gray)
        }
    }
}

struct CompletedMark_Previews: PreviewProvider {
    static var previews: some View {
        CompletedMark(isSet: .constant(true))
    }
}
