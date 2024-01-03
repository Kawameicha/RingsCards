//
//  AppSidebarList.swift
//  RingsCards
//
//  Created by Christoph Freier on 01.01.24.
//

import SwiftUI

struct AppSidebarList: View {
    @Binding var selection: AppScreen?

    var body: some View {
        List(AppScreen.allCases, selection: $selection) { screen in
            NavigationLink(value: screen) {
                screen.label
            }
        }
        .navigationTitle("RingsCards")
    }
}

#Preview {
    NavigationSplitView {
        AppSidebarList(selection: .constant(.cards))
    } detail: {
        Text(verbatim: "Check out that sidebar!")
    }
}
