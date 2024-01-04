//
//  CampaignHeroList.swift
//  RingsCards
//
//  Created by Christoph Freier on 12.11.23.
//

import SwiftUI
import SwiftData

struct CampaignHeroList: View {
    @Query private var cards: [Card]

    var campaign: Campaign
    var deck: Deck

    init(
        campaign: Campaign,
        deck: Deck,

        filterSphere: FilterSphere = .all,
        filterType: FilterType = .any,
        filterPack: [String] = [],
        filterDeck: [String] = [],
        sortParameter: SortParameter = .name,
        sortOrder: SortOrder = .forward,
        searchText: String = ""
    ) {
        self.campaign = campaign
        self.deck = deck

        let predicate = Card.predicate(searchText: searchText,
                                       filterSphere: filterSphere.rawValue,
                                       filterType: filterType.rawValue,
                                       filterPack: filterPack,
                                       filterDeck: deck.heroes.map{ String($0.key) })
        switch sortParameter {
        case .name: _cards = Query(filter: predicate, sort: \.name, order: sortOrder)
        case .sphere: _cards = Query(filter: predicate, sort: \.sphere_code, order: sortOrder)
        }
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("Heroes")
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)

            ScrollView(.horizontal, showsIndicators: false) {
                VStack(alignment: .leading) {
                    ForEach(cards) { card in
                        NavigationLink {
                            CardView(card: card)
                        } label: {
                            CardRow(card: card)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ModelPreview { campaign in
        CampaignHeroList(campaign: campaign, deck: SampleDeck.contents[0])
    }
    .environment(ViewModel())
    .modelContainer(previewModelContainer)
}
