//
//  LoginView.swift
//  RingsCards
//
//  Created by Shane Eastwood on 2023-08-22.
//

import Foundation

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var ringsData: RingsData
    @State private var username = ""
    @State private var passwd = ""

    var body: some View {
        VStack{
            TextField("Enter Username", text: $username)
                .padding()
            TextField("Enter Password ", text: $passwd)
                .padding()
            Text("Login")
                
//            Button("Login") {
//                Void
//            }

        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(RingsData())
    }
}

