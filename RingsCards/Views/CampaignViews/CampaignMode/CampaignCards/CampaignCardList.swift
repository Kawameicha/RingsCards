//
//  CampaignCardList.swift
//  RingsCards
//
//  Created by Christoph Freier on 11.11.23.
//

import SwiftUI
import SwiftData

struct CampaignCardList: View {
    @Query private var cards: [Card]
    @Binding var editBoons: Bool

    var campaign: Campaign

    init(
        campaign: Campaign,
        editBoons: Binding<Bool>,

        filterSphere: FilterSphere = .all,
        filterType: FilterType = .any,
        filterPack: [String] = [],
        filterDeck: [String] = [],
        sortParameter: SortParameter = .name,
        sortOrder: SortOrder = .forward,
        searchText: String = ""
    ) {
        self.campaign = campaign
        self._editBoons = editBoons

        let predicate = Card.predicate(searchText: searchText,
                                       filterSphere: filterSphere.rawValue,
                                       filterType: filterType.rawValue,
                                       filterPack: filterPack,
                                       filterDeck: campaign.slots.map{ String($0.key) })
        switch sortParameter {
        case .name: _cards = Query(filter: predicate, sort: \.name, order: sortOrder)
        case .sphere: _cards = Query(filter: predicate, sort: \.sphere_code, order: sortOrder)
        }
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("Boons & Burdens")
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)

            ScrollView(.horizontal, showsIndicators: false) {
                VStack(alignment: .leading) {
                    if editBoons == false {
                        ForEach(cards.filter { card in
                            campaign.slots.filter { $1 > 0 }.map { $0.key }.contains(card.code)
                        }) { card in
                            NavigationLink {
                                CardView(card: card)
                            } label: {
                                CardRow(card: card, value: campaign.slots["\(card.code)", default: 0])
                            }
                        }
                    } else {
                        ForEach(cards) { card in
                            NavigationLink {
                                CardView(card: card)
                            } label: {
                                CampaignCardEdit(campaign: campaign, card: card, value: campaign.slots["\(card.code)", default: 0])
                            }
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
        CampaignCardList(campaign: campaign, editBoons: .constant(true))
    }
    .environment(ViewCardModel())
    .modelContainer(previewModelContainer)
}
