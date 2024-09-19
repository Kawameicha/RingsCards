//
//  ContentView.swift
//  RingsCards
//
//  Created by Christoph Freier on 19.08.23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State var selection: AppScreen? = .cards
    @State var prefersTabNavigation = true
    @State var showOnboarding = false

    var body: some View {
        ZStack {
            if showOnboarding {
                OnboardingView(showOnboarding: $showOnboarding)
                    .task {
                        await CardResponse.refresh(modelContext: modelContext)
                    }
            } else if prefersTabNavigation {
                AppTabView(selection: $selection)
            } else {
                NavigationSplitView {
                    AppSidebarList(selection: $selection)
                } detail: {
                    AppDetailColumn(screen: selection)
                }
            }
        }
        .onAppear {
            checkAppVersion()
        }
    }

    func checkAppVersion() {
        let currentVersion = getAppVersion()
        let storedVersion = UserDefaults.standard.string(forKey: "appVersion")

        if storedVersion != currentVersion {
            showOnboarding = true
            UserDefaults.standard.set(currentVersion, forKey: "appVersion")
        }
    }

    func getAppVersion() -> String {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "0"
        let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "0"
        return "\(version) (\(build))"
    }
}

#Preview {
    ContentView()
        .modelContainer(previewModelContainer)
        .environment(ViewCardModel())
        .environment(ViewDeckModel())
        .environment(ViewCampaignModel())
        .environment(ViewRuleModel())
}
