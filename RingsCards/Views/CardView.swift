//
//  CardView.swift
//  RingsCards
//
//  Created by Christoph Freier on 19.08.23.
//

import SwiftUI

struct CardView: View {
    var card: Card

    var body: some View {
        VStack {
            Text(card.name)
                .foregroundColor(.primary)
                .font(.title)
                .padding()
            HStack {
                Label(card.sphere_name, systemImage: "person")
            }
            .foregroundColor(.secondary)
        }
    }
}
