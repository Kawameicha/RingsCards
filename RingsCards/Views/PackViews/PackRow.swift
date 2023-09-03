////
////  PackRow.swift
////  RingsCards
////
////  Created by Christoph Freier on 22.08.23.
////
//
//import SwiftUI
//
//struct PackRow: View {
//    @EnvironmentObject var ringsData: RingsData
//
//    var pack: Pack
//
//    var packIndex: Int {
//        ringsData.packs.firstIndex(where: { $0.id == pack.id })!
//    }
//
//    var body: some View {
//        HStack {
//            Text(pack.name)
//                .foregroundColor(.primary)
//                .font(.headline)
//            Spacer()
//            CollectionButton(isSet: $ringsData.packs[packIndex].inCollection)
//                .buttonStyle(PlainButtonStyle())
//        }
//    }
//}
//
//struct PackRow_Previews: PreviewProvider {
//    static var packs = RingsData().packs
//
//    static var previews: some View {
//        Group {
//            PackRow(pack: packs[0])
//                .environmentObject(RingsData())
//        }
//    }
//}
