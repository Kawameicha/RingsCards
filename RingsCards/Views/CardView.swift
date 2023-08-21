//
//  CardView.swift
//  RingsCards
//
//  Created by Christoph Freier on 19.08.23.
//

import SwiftUI

//extension Color {
//    static let Leadership = Color("Leadership")
//    static let Lore = Color("Lore")
//    static let Spirit = Color("Spirit")
//    static let Tactics = Color("Tactics")
//}

struct CardView: View {
    var card: Card

    var body: some View {
        ScrollView {
            CircleImage(image: Image("Person"))

            VStack(alignment: .leading) {
                Text(card.name)
                    .font(.title)

                HStack {
                    Text(card.traits)
                    Spacer()
                    Text(card.type_name)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                Text(card.text)
                
            }
            .padding()
        }
        .background(LinearGradient(
            colors: [Color(card.sphere_name), Color.white],
            startPoint: .top, endPoint: .center))
    }
}
