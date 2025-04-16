//
//  AuthRouterView.swift
//  LiveEducationApp
//
//  Created by Bohdan Borysenko on 12.04.2025.
//

import SwiftUI

struct AuthView: View {
    @State private var showSignUp = false
    @Binding var isAuthenticated: Bool

    var body: some View {
        if showSignUp {
            SignUpView(showSignUp: $showSignUp, isAuthenticated: $isAuthenticated)
        } else {
            LoginView(showSignUp: $showSignUp, isAuthenticated: $isAuthenticated)
        }
    }
}
