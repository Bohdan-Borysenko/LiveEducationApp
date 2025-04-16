//
//  LiveEducationApp.swift
//  LiveEducationApp
//
//  Created by Bohdan Borysenko on 15.04.2025.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth

@main
struct LiveEducationAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    @AppStorage("isDarkMode") var isDarkMode: Bool = false

    @StateObject var authVM = AuthViewModel()
    @State private var showSignUp = false
    @State private var isAuthenticated = false

    var body: some Scene {
        WindowGroup {
            Group {
                if hasSeenOnboarding {
                    if authVM.user != nil {
                        MainTabView()
                            .environmentObject(authVM)
                    } else if showSignUp {
                        SignUpView(showSignUp: $showSignUp, isAuthenticated: $isAuthenticated)
                            .environmentObject(authVM)
                    } else {
                        LoginView(showSignUp: $showSignUp, isAuthenticated: $isAuthenticated)
                            .environmentObject(authVM)
                    }
                } else {
                    OnboardingView()
                }
            }
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
