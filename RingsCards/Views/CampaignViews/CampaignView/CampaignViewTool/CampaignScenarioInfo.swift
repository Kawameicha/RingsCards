//
//  CampaignScenarioInfo.swift
//  RingsCards
//
//  Created by Christoph Freier on 07.03.24.
//

import SwiftUI

struct CampaignScenarioInfo: View {
    var campaign: Campaign

    var body: some View {
        let completed = campaign.completed.filter { $0 }.count
        let nScenario = campaign.completed.count

        if completed == 0 {
            Text("No scenario completed")
        } else if completed == nScenario {
            Text("All scenarios completed")
        } else if completed < 2 {
            Text("\(completed) scenario completed")
        } else {
            Text("\(completed) scenarios completed")
        }
    }
}

#Preview {
    ModelPreview { campaign in
        CampaignScenarioInfo(campaign: campaign)
    }
    .modelContainer(previewModelContainer)
}
