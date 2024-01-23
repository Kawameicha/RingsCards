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
    @Environment(\.modelContext) var modelContext
    @State var campaignName: String = ""
    @State var campaignMode: Bool = false
    @State var selectedCode: CampaignCode = .core

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

                Toggle("Campaign Mode", isOn: $campaignMode)
                    .toggleStyle(CheckboxStyle())
            }

            Section {
                HStack {
                    Spacer()
                    Button("Create Campaign", action: {
                        if selectedCode == .core {
                            modelContext.insert(Campaign(name: campaignName,
                                                         code: selectedCode.rawValue,
                                                         scenarios: Array(1...3),
                                                         completed: Array(repeating: false, count:3),
                                                         campaignMode: campaignMode,
                                                         slots: ["01132": 0, "01133": 0, "01134": 0, "01135": 0, "01136": 0, "01137": 0, "01138": 0]))
                        } else if selectedCode == .mirkwood {
                            modelContext.insert(Campaign(name: campaignName,
                                                         code: selectedCode.rawValue,
                                                         scenarios: Array(4...9),
                                                         completed: Array(repeating: false, count:6),
                                                         campaignMode: false,
                                                         slots: ["": 0]))
                        } else if selectedCode == .dwarrowdelf {
                            modelContext.insert(Campaign(name: campaignName,
                                                         code: selectedCode.rawValue,
                                                         scenarios: Array(11...19),
                                                         completed: Array(repeating: false, count:9),
                                                         campaignMode: false,
                                                         slots: ["": 0]))
                        } else if selectedCode == .shadow {
                            modelContext.insert(Campaign(name: campaignName,
                                                         code: selectedCode.rawValue,
                                                         scenarios: Array(21...29),
                                                         completed: Array(repeating: false, count:9),
                                                         campaignMode: false,
                                                         slots: ["": 0]))
                        } else if selectedCode == .ring {
                            modelContext.insert(Campaign(name: campaignName,
                                                         code: selectedCode.rawValue,
                                                         scenarios: Array(31...39),
                                                         completed: Array(repeating: false, count:9),
                                                         campaignMode: false,
                                                         slots: ["": 0]))
                        } else if selectedCode == .angmar {
                            modelContext.insert(Campaign(name: campaignName,
                                                         code: selectedCode.rawValue,
                                                         scenarios: Array(41...49),
                                                         completed: Array(repeating: false, count:9),
                                                         campaignMode: campaignMode,
                                                         slots: ["10157": 0, "10158": 0, "10159": 0, "10160": 0, "10161": 0, "10162": 0, "10163": 0, "10164": 0, "10165": 0, "10166": 0, "10167": 0, "10168": 0, "10169": 0, "10170": 0, "10171": 0, "10172": 0, "10173": 0, "10174": 0, "10175": 0, "10176": 0, "10177": 0, "10178": 0, "10179": 0, "10180": 0, "10181": 0, "10182": 0, "10183": 0, "10184": 0, "10185": 0, "10186": 0, "10187": 0, "10188": 0, "10189": 0, "10190": 0, "10191": 0, "10192": 0]))
                        } else if selectedCode == .dream {
                            modelContext.insert(Campaign(name: campaignName,
                                                         code: selectedCode.rawValue,
                                                         scenarios: Array(51...59),
                                                         completed: Array(repeating: false, count:9),
                                                         campaignMode: false,
                                                         slots: ["": 0]))
                        } else if selectedCode == .haradrim {
                            modelContext.insert(Campaign(name: campaignName,
                                                         code: selectedCode.rawValue,
                                                         scenarios: Array(61...69),
                                                         completed: Array(repeating: false, count:9),
                                                         campaignMode: false,
                                                         slots: ["": 0]))
                        } else if selectedCode == .mithrin {
                            modelContext.insert(Campaign(name: campaignName,
                                                         code: selectedCode.rawValue,
                                                         scenarios: Array(71...79),
                                                         completed: Array(repeating: false, count:9),
                                                         campaignMode: false,
                                                         slots: ["": 0]))
                        } else if selectedCode == .mordor {
                            modelContext.insert(Campaign(name: campaignName,
                                                         code: selectedCode.rawValue,
                                                         scenarios: Array(81...89),
                                                         completed: Array(repeating: false, count:9),
                                                         campaignMode: false,
                                                         slots: ["": 0]))
                        } else if selectedCode == .rohirrim {
                            modelContext.insert(Campaign(name: campaignName,
                                                         code: selectedCode.rawValue,
                                                         scenarios: Array(91...99),
                                                         completed: Array(repeating: false, count:9),
                                                         campaignMode: false,
                                                         slots: ["": 0]))
                        } else if selectedCode == .hobbit {
                            modelContext.insert(Campaign(name: campaignName,
                                                         code: selectedCode.rawValue,
                                                         scenarios: Array(1001...1006),
                                                         completed: Array(repeating: false, count:6),
                                                         campaignMode: false,
                                                         slots: ["": 0]))
                        } else if selectedCode == .lotr {
                            modelContext.insert(Campaign(name: campaignName,
                                                         code: selectedCode.rawValue,
                                                         scenarios: Array(1011...1028),
                                                         completed: Array(repeating: false, count:18),
                                                         campaignMode: campaignMode,
                                                         slots: ["141017": 0, "141018": 0, "141019": 0, "141020": 0, "141021": 0, "141077": 0, "141078": 0, "141079": 0, "141080": 0, "141081": 0, "141082": 0, "141083": 0, "141084": 0, "142011": 0, "142012": 0, "142013": 0, "142014": 0, "142015": 0, "142016": 0, "142017": 0, "142018": 0, "142084": 0, "142085": 0, "142086": 0, "142087": 0, "142088": 0, "142089": 0, "142090": 0, "143015": 0, "143016": 0, "143017": 0, "143018": 0, "143019": 0, "143020": 0, "143021": 0, "143068": 0, "144014": 0, "144015": 0, "144052": 0, "145014": 0, "145015": 0, "145016": 0, "145062": 0, "145068": 0, "146041": 0]))
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
}
