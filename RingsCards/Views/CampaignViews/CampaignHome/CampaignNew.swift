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
                    Text("Shadows of Mirkwood").tag(CampaignCode.mirkwood)
                    Text("Dwarrowdelf").tag(CampaignCode.dwarrowdelf)
                    Text("Against the Shadow").tag(CampaignCode.shadow)
                    Text("The Ring-maker").tag(CampaignCode.ring)
                    Text("Angmar Awakened").tag(CampaignCode.angmar)
                    Text("Dream-chaser").tag(CampaignCode.dream)
                    Text("Haradrim").tag(CampaignCode.haradrim)
                    Text("Ered Mithrin").tag(CampaignCode.mithrin)
                    Text("Vengeance of Mordor").tag(CampaignCode.mordor)
                    Text("Oaths of the Rohirrim").tag(CampaignCode.rohirrim)
                    Text("The Hobbit").tag(CampaignCode.hobbit)
                    Text("The Lord of the Rings").tag(CampaignCode.lotr)
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
                                                         scenarios: Array(4...9),
                                                         completed: Array(repeating: false, count:6)))
                        } else if selectedCode == .dwarrowdelf {
                            modelContext.insert(Campaign(name: campaignName,
                                                         code: selectedCode.rawValue,
                                                         scenarios: Array(11...19),
                                                         completed: Array(repeating: false, count:9)))
                        } else if selectedCode == .shadow {
                            modelContext.insert(Campaign(name: campaignName,
                                                         code: selectedCode.rawValue,
                                                         scenarios: Array(21...29),
                                                         completed: Array(repeating: false, count:9)))
                        } else if selectedCode == .ring {
                            modelContext.insert(Campaign(name: campaignName,
                                                         code: selectedCode.rawValue,
                                                         scenarios: Array(31...39),
                                                         completed: Array(repeating: false, count:9)))
                        } else if selectedCode == .angmar {
                            modelContext.insert(Campaign(name: campaignName,
                                                         code: selectedCode.rawValue,
                                                         scenarios: Array(41...49),
                                                         completed: Array(repeating: false, count:9)))
                        } else if selectedCode == .dream {
                            modelContext.insert(Campaign(name: campaignName,
                                                         code: selectedCode.rawValue,
                                                         scenarios: Array(51...59),
                                                         completed: Array(repeating: false, count:9)))
                        } else if selectedCode == .haradrim {
                            modelContext.insert(Campaign(name: campaignName,
                                                         code: selectedCode.rawValue,
                                                         scenarios: Array(61...69),
                                                         completed: Array(repeating: false, count:9)))
                        } else if selectedCode == .mithrin {
                            modelContext.insert(Campaign(name: campaignName,
                                                         code: selectedCode.rawValue,
                                                         scenarios: Array(71...79),
                                                         completed: Array(repeating: false, count:9)))
                        } else if selectedCode == .mordor {
                            modelContext.insert(Campaign(name: campaignName,
                                                         code: selectedCode.rawValue,
                                                         scenarios: Array(81...89),
                                                         completed: Array(repeating: false, count:9)))
                        } else if selectedCode == .rohirrim {
                            modelContext.insert(Campaign(name: campaignName,
                                                         code: selectedCode.rawValue,
                                                         scenarios: Array(91...99),
                                                         completed: Array(repeating: false, count:9)))
                        } else if selectedCode == .hobbit {
                            modelContext.insert(Campaign(name: campaignName,
                                                         code: selectedCode.rawValue,
                                                         scenarios: Array(1001...1006),
                                                         completed: Array(repeating: false, count:6)))
                        } else if selectedCode == .lotr {
                            modelContext.insert(Campaign(name: campaignName,
                                                         code: selectedCode.rawValue,
                                                         scenarios: Array(1011...1028),
                                                         completed: Array(repeating: false, count:18)))
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
