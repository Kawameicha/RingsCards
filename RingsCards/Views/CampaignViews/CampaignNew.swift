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
    @State private var selectedCode: Campaign.CampaignCode = .core

    var body: some View {
        Form {
            Section {
                TextField("New Campaign Name", text: $campaignName)

                Picker("Select Cycle", selection: $selectedCode) {
                    Text("Core Set").tag(Campaign.CampaignCode.core)
                    Text("Core & Mirkwood").tag(Campaign.CampaignCode.mirkwood)
                }
            }

            Section {
                HStack {
                    Spacer()
                    Button("Create Campaign", action: {
                        if selectedCode == .core {
                            ringsData.campaigns.append(Campaign(id: UUID(),
                                                                name: campaignName,
                                                                code: Campaign.CampaignCode.core,
                                                                scenarios: [1,2,3],
                                                                completed: [false,false,false],
                                                                fallenHeros: "",
                                                                threatPenalty: 0,
                                                                notes: "",
                                                                boons: "",
                                                                burdens: ""))
                        } else if selectedCode == .mirkwood {
                            ringsData.campaigns.append(Campaign(id: UUID(),
                                                                name: campaignName,
                                                                code: Campaign.CampaignCode.mirkwood,
                                                                scenarios: [1,2,3,4,5,6,7,8,9],
                                                                completed: [false,false,false,false,false,false,false,false,false],
                                                                fallenHeros: "",
                                                                threatPenalty: 0,
                                                                notes: "",
                                                                boons: "",
                                                                burdens: ""))
                        }

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
