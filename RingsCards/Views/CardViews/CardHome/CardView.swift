//
//  CardView.swift
//  RingsCards
//
//  Created by Christoph Freier on 19.08.23.
//

import SwiftUI
import RegexBuilder

struct CardView: View {
    var card: Card

    var body: some View {
        ScrollView {
            CardImage(card: card)
                .offset(y: -100)
                .padding(.bottom, -200)

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

                Text(.init(card.text
                    .htmlToMarkDown()
                    .iconsAndSpheres()
                ))
                .font(Font.custom("SFUIText-Regular", size: 16))
            }
            .padding()
        }
//        .background(LinearGradient(
//            colors: [Color(card.sphere_name), Color.white],
//            startPoint: .top, endPoint: .center))
    }
}

#Preview {
    ModelPreview { card in
        CardView(card: card)
    }
    .modelContainer(previewModelContainer)
}
