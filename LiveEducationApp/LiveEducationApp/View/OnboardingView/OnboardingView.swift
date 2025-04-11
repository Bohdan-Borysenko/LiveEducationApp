//
//  ContentView.swift
//  LiveEducationApp
//
//  Created by Bohdan Borysenko on 11.04.2025.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    
    var body: some View {
        VStack {
            Image("Logo")
            Text("Ajher")
                .font(.custom("Poppins-Medium", size: 52))
                .kerning(2)
                .fontWeight(.bold)
                .foregroundColor(Color("PrimaryRed")) +
            Text("yuk")
                .font(.custom("Poppins-Medium", size: 52))
                .fontWeight(.medium)
            
            Text("Welcome to Ajheryuk")
                .font(.custom("Poppins-SemiBold", size: 20))
                .padding(.top, 60)
            Text("Best and popular apps for live education \n course from home")
                .foregroundColor(Color("NeutralGray"))
                .multilineTextAlignment(.center)
                .padding(.bottom, 90)
            
            Button(action: {
                withAnimation {
                    hasSeenOnboarding = true
                            }
                        }) {
                            Text("Get Started")
                                .font(.custom("Poppins-Medium", size: 23))
                                .fontWeight(.medium)
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.vertical, 16) // высота фона
                                .padding(.horizontal, 114) // ширина фона
                                .background(Color("PrimaryRed"))
                                    .cornerRadius(12)
                            }
            
        }
        .padding()
    }
}

#Preview {
    OnboardingView()
}
