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
                TextField("Notes", text: $campaign.notes)
            }

            HStack {
                Text("Boons").bold()
                Divider()
                TextField("Boon", text: $campaign.boons)
            }

            HStack {
                Text("Burden").bold()
                Divider()
                TextField("Burden", text: $campaign.burdens)
            }
        }
    }
}

struct CampaignEdit_Previews: PreviewProvider {
    static var previews: some View {
        CampaignEdit(campaign: .constant(.default))
    }
}
