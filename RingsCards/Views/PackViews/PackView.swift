////
////  PackView.swift
////  RingsCards
////
////  Created by Christoph Freier on 22.08.23.
////
//
//import SwiftUI
//
//struct PackView: View {
//    @EnvironmentObject var ringsData: RingsData
//    @State private var searchText: String = ""
//
//    var pack: Pack
//
//    var collectionOnly: [Card] {
//        ringsData.cards.filter{ card in
//            card.pack_code.contains(pack.code)
//        }
//    }
//
//    var filteredCards: [Card] {
//        guard !searchText.isEmpty else { return collectionOnly }
//        return collectionOnly.filter { card in
//            card.name.lowercased().contains(searchText.lowercased())
//        }
//    }
//
//    var body: some View {
//        NavigationView {
//            List(filteredCards) { card in
//                NavigationLink {
//                    CardView(card: card)
//                } label: {
//                    CardRow(card: card)
//                }
//            }
//            .navigationTitle("\(pack.name)")
//        }
//        .searchable(text: $searchText)
//    }
//}
//
//struct PackView_Previews: PreviewProvider {
//    static var packs = RingsData().packs
//
//    static var previews: some View {
//        PackView(pack: packs[0])
//            .environmentObject(RingsData())
//    }
//}
