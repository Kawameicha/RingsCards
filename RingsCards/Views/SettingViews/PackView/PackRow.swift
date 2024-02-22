//
//  PackRow.swift
//  RingsCards
//
//  Created by Christoph Freier on 08.10.23.
//

import SwiftUI
import SwiftData

struct PackRow: View {
    @Environment(\.modelContext) var modelContext
    @Query var otherPacks: [Pack]
    @Bindable var pack: Pack
    @State var markCycle = false
    
    init(
         pack: Pack,
         markCycle: Bool = false
    ) {
        self.pack = pack
        self.markCycle = markCycle
        let cycle = pack.cycleSort

        _otherPacks = Query(filter: #Predicate<Pack> { otherPacks in
            (otherPacks.cycleSort == cycle) && otherPacks.packSort > 0 })
    }

    var body: some View {
        HStack {
            PackIcon(image: Image(pack.cycleCode))

            Toggle("\(pack.packName)", isOn: $pack.isInCollection)
                .onChange(of: pack.isInCollection) {
                    if pack.isInCollection && pack.packSort == 0 && pack.isCycle {
                        markCycle = true
                    }
                }
                .alert(isPresented:$markCycle) {
                    Alert(
                        title: Text("Would you like to select the entire cycle?"),
                        primaryButton: .default(Text("Yes")) {
                            otherPacks.forEach { pack in
                                pack.isInCollection = true
                            }
                        },
                        secondaryButton: .cancel(Text("No"))
                    )
                }
                .toggleStyle(CheckboxStyle())
        }
    }
}

#Preview {
    ModelPreview { pack in
        PackRow(pack: pack)
    }
    .modelContainer(previewModelContainer)
}
