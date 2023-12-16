//
//  CampaignDeckAdd.swift
//  RingsCards
//
//  Created by Christoph Freier on 15.11.23.
//

import SwiftUI
import SwiftData

struct CampaignDeckAdd: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Deck.date_update, order: .reverse) private var decks: [Deck]

    var campaign: Campaign
    @State private var deck = [Deck]()

    var body: some View {
        Form {
            Section {
                Picker("Select a Deck", selection: $deck) {
                    ForEach(decks) { deck in
                        Text(deck.name)
                    }
                }
            }

            Section {
                HStack {
                    Spacer()
                    Button("Add Deck", action: {
                        campaign.decks? += deck
                        self.presentationMode.wrappedValue.dismiss()
                    })
                    Spacer()
                }
            }
        }
        .navigationTitle("Add Deck")
    }
}

#Preview {
    ModelPreview { campaign in
        CampaignDeckAdd(campaign: campaign)
    }
    .environment(ViewCardModel())
    .modelContainer(previewModelContainer)
}
