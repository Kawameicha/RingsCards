//
//  CampaignNew.swift
//  RingsCards
//
//  Created by Christoph Freier on 06.09.23.
//

import SwiftUI

struct CampaignNew: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var ringsData: RingsData

    @State private var campaignName: String = ""

    var body: some View {
        Form {
            Section {
                TextField("New Campaign Name", text: $campaignName)
            }

            Section {
                HStack {
                    Spacer()
                    Button("Create", action: {
                        ringsData.campaigns.append(Campaign(id: UUID(),
                                                            name: campaignName,
                                                            code: Campaign.CampaignCode.core,
                                                            scenarioId: [1,2,3],
                                                            scenarioCompleted: [false,false,false],
                                                            fallenHeros: "",
                                                            threatPenalty: 0,
                                                            notes: "",
                                                            boons: "",
                                                            burdens: ""))

                        self.presentationMode.wrappedValue.dismiss()
                    })
                    Spacer()
                }
            }
        }
        .navigationTitle("New Campaign")
    }
}

struct CampaignNew_Previews: PreviewProvider {
    static var previews: some View {
        CampaignNew()
    }
}
