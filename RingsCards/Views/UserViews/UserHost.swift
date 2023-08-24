//
//  UserHost.swift
//  RingsCards
//
//  Created by Christoph Freier on 24.08.23.
//

import SwiftUI

struct UserHost: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var ringsData: RingsData
    @State private var draftUser = User.default

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftUser = ringsData.user
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }

            if editMode?.wrappedValue == .inactive {
                UserView(user: ringsData.user)
            } else {
                UserEdit(user: $draftUser)
                    .onAppear {
                        draftUser = ringsData.user
                    }
                    .onDisappear {
                        ringsData.user = draftUser
                    }
            }
        }
        .padding()
    }
}

struct UserHost_Previews: PreviewProvider {
    static var previews: some View {
        UserHost()
            .environmentObject(RingsData())
    }
}
