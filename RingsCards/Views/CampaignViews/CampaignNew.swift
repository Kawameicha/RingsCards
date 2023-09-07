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
                            ringsData.campaigns.append(Campaign(name: campaignName,
                                                                code: .core,
                                                                scenarios: Array(1...3),
                                                                completed: Array(repeating: false, count:3)))
                        } else if selectedCode == .mirkwood {
                            ringsData.campaigns.append(Campaign(name: campaignName,
                                                                code: .mirkwood,
                                                                scenarios: Array(1...9),
                                                                completed: Array(repeating: false, count:9)))
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
