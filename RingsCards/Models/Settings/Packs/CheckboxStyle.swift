//
//  CheckboxStyle.swift
//  RingsCards
//
//  Created by Christoph Freier on 20.01.24.
//

import SwiftUI

struct CheckboxStyle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            configuration.label

            Spacer()

            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .foregroundColor(configuration.isOn ? .yellow : .gray)
                .font(.system(size: 20, weight: .bold, design: .default))
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}
