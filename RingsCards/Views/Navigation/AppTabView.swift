//
//  AppTabView.swift
//  RingsCards
//
//  Created by Christoph Freier on 01.01.24.
//

import SwiftUI

struct AppTabView: View {
    @Binding var selection: AppScreen?

    var body: some View {
        TabView(selection: $selection) {
            ForEach(AppScreen.allCases) { screen in
                screen.destination
                    .tag(screen as AppScreen?)
                    .tabItem { screen.label }
            }
        }
    }
}

#Preview {
    AppTabView(selection: .constant(.cards))
        .modelContainer(previewModelContainer)
        .environment(ViewCardModel())
        .environment(ViewDeckModel())
        .environment(ViewCampaignModel())
}
