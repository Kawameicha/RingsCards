//
//  OnboardingView.swift
//  RingsCards
//
//  Created by Christoph Freier on 18.09.24.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var showOnboarding: Bool

    var body: some View {
        VStack {
            TabView {
                OnboardingDetailView(title: "Refined Card View", image: "rectangle.portrait.inset.filled", description: "Enjoy a beautiful and intuitive card experience and add cards to your deck directly from the detail view.")
                OnboardingDetailView(title: "Messenger of the King", image: "person.2.fill", description: "Maximize use of this contract by seamlessly adding the hero version of any eligible ally to your deck.")
                OnboardingDetailView(title: "Official Campaign Mode", image: "book.pages.fill", description: "Benefit from all the official boon and burden cards when choosing to play in campaign mode.")
            }
            .tabViewStyle(.page)

            Spacer()

            Button("Get Started") {
                showOnboarding = false
            }
            .padding()
            .font(.title3)
            .background(Color.yellow)
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding(.bottom)
        }
    }
}

struct OnboardingDetailView: View {
    var title: String
    var image: String
    var description: String

    var body: some View {
        VStack {
            Image(systemName: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .padding()

            Text(title)
                .font(.largeTitle)
                .padding()

            Text(description)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

#Preview {
    OnboardingView(showOnboarding: .constant(true))
}