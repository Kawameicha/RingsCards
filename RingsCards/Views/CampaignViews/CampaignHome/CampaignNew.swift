//
//  CampaignNew.swift
//  RingsCards
//
//  Created by Christoph Freier on 06.09.23.
//

import SwiftUI
import SwiftData

struct CampaignNew: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.modelContext) private var modelContext
    @State private var campaignName: String = ""
    @State private var selectedCode: CampaignCode = .core

    var body: some View {
        Form {
            Section {
                TextField("New Campaign Name", text: $campaignName)

                Picker("Select Cycle", selection: $selectedCode) {
                    Text("Core Set").tag(CampaignCode.core)
                    Text("Core & Mirkwood").tag(CampaignCode.mirkwood)
                }
            }

            Section {
                HStack {
                    Spacer()
                    Button("Create Campaign", action: {
                        if selectedCode == .core {
                            modelContext.insert(Campaign(name: campaignName,
                                                          code: selectedCode.rawValue,
                                                          scenarios: Array(1...3),
                                                          completed: Array(repeating: false, count:3)))
                        } else if selectedCode == .mirkwood {
                            modelContext.insert(Campaign(name: campaignName,
                                                          code: selectedCode.rawValue,
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

#Preview {
    CampaignNew()
        .modelContainer(previewModelContainer)
}
