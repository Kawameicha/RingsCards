//
//  CampaignHost.swift
//  RingsCards
//
//  Created by Christoph Freier on 04.09.23.
//

import SwiftUI
import SwiftData

struct CampaignHost: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.editMode) var editMode
    @State private var draftCampaign = Campaign(code: "", name: "", scenarios: [], completed: [], campaignMode: false)

    var campaign: Campaign

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftCampaign = campaign.self
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }

            if editMode?.wrappedValue == .inactive {
                CampaignView(campaign: campaign.self)
            } else {
                CampaignEdit(campaign: $draftCampaign)
                    .onAppear {
                        draftCampaign = campaign.self
                    }
                    .onDisappear {
                        modelContext.insert(draftCampaign)
                }
            }
        }
        .padding()
    }
}

//#Preview {
//    ModelPreview { campaign in
//        CampaignHost(campaign: campaign)
//    }
//    .modelContainer(previewModelContainer)
//}
