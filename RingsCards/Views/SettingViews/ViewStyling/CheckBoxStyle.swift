//
//  CheckBoxStyle.swift
//  RingsCards
//
//  Created by Christoph Freier on 20.01.24.
//

import SwiftUI

struct CheckBoxStyle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            configuration.label

            Spacer()

            Image(systemName: configuration.isOn ? "checkmark.circle" : "circle")
                .foregroundColor(configuration.isOn ? .accent : .gray)
                .font(.system(size: 20, weight: .bold, design: .default))
                .onTapGesture {
                    withAnimation( .snappy, {
                        configuration.isOn.toggle()
                    })
                }
        }
    }
}
