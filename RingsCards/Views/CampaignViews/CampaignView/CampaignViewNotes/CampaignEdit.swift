//
//  CampaignEdit.swift
//  RingsCards
//
//  Created by Christoph Freier on 04.09.23.
//

import SwiftUI

struct CampaignEdit: View {
    @Binding var campaign: Campaign

    var body: some View {
        List {
            HStack {
                Text("Name").bold()
                Divider()
                TextField("Name", text: $campaign.name)
            }

            HStack {
                Text("Notes").bold()
                Divider()
                TextEditor(text: $campaign.notes)
            }
        }
    }
}
