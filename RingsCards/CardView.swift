//
//  CardView.swift
//  RingsCards
//
//  Created by Christoph Freier on 19.08.23.
//

import SwiftUI

struct Card: Identifiable {
     let id = UUID()
     var name: String
     var sphere_name: String
 }

var cards = [
    Card(name: "Frodo Baggins", sphere_name: "Leadership"),
    Card(name: "Sam Gamgee", sphere_name: "Spirit"),
    Card(name: "Pippin Took", sphere_name: "Lore"),
    Card(name: "Merry Brandybuck", sphere_name: "Tactics")
]

struct Cards: View {
    var card: Card

    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(card.name)
                .foregroundColor(.primary)
                .font(.headline)
            HStack(spacing: 3) {
                Label(card.sphere_name, systemImage: "person")
            }
            .foregroundColor(.secondary)
            .font(.subheadline)
        }
    }
}


struct CardView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(cards) { card in
                    NavigationLink(destination: CardDetailView(card: card)) {
                        Cards(card: card)
                    }
                }
            }
            .navigationTitle("Player Cards")
        }
    }
}

struct CardDetailView: View {
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
