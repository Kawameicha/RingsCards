////
////  PackList.swift
////  RingsCards
////
////  Created by Christoph Freier on 22.08.23.
////
//
//import SwiftUI
//
//struct PackList: View {
//    @EnvironmentObject var ringsData: RingsData
//
//    var body: some View {
//        NavigationView {
//            List(ringsData.packs) { pack in
//                NavigationLink {
//                    PackView(pack: pack)
//                } label: {
//                    PackRow(pack: pack)
//                }
//            }
//            .listStyle(.inset)
//            .navigationTitle("My Collection")
//        }
//    }
//}
//
//struct PackList_Previews: PreviewProvider {
//    static var previews: some View {
//        PackList()
//            .environmentObject(RingsData())
//    }
//}
