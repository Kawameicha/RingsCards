//
//  CampaignEdit.swift
//  RingsCards
//
//  Created by Christoph Freier on 04.09.23.
//

import SwiftUI

struct CampaignEdit: View {
    @Binding var campaign: Campaign
    @State private var hasChanged = false

    var body: some View {
        List {
            HStack {
                Text("Name").bold()
                Divider()
                TextField("Name", text: $campaign.name)
                    .onChange(of: campaign.name) {
                        hasChanged = true
                    }
            }

            HStack {
                Text("Threat Penalty").bold()
                Button {
                    campaign.threatModifs -= 1
                    hasChanged = true
                } label: {
                    Image(systemName: "minus.square")
                }
                .buttonStyle(PlainButtonStyle())

                Text("\(campaign.threatModifs)")
                    .onChange(of: campaign.threatModifs) {
                        hasChanged = true
                    }

                Button {
                    campaign.threatModifs += 1
                    hasChanged = true
                } label: {
                    Image(systemName: "plus.square")
                }
                .buttonStyle(PlainButtonStyle())
            }

            HStack {
                Text("Notes").bold()
                Divider()
                TextEditor(text: $campaign.campaignNote)
                    .onChange(of: campaign.campaignNote) {
                        hasChanged = true
                    }
            }
        }
        .onDisappear {
            if hasChanged {
                campaign.updated = Date()
            }
        }
    }
}
