//
//  LiveEducationAppApp.swift
//  LiveEducationApp
//
//  Created by Bohdan Borysenko on 11.04.2025.
//

import SwiftUI

@main
struct LiveEducationAppApp: App {
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if hasSeenOnboarding {
                LoginView()
            } else {
                OnboardingView()
            }
        }
    }
}
