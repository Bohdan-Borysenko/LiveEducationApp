//
//  AuthContainerView.swift
//  LiveEducationApp
//
//  Created by Bohdan Borysenko on 15.04.2025.
//

import Foundation
import SwiftUI

struct AuthContainerView: View {
    @Binding var isAuthenticated: Bool
    @State private var showSignUp = false
    @StateObject var authVM = AuthViewModel()
    
    var body: some View {
        if showSignUp {
            SignUpView(showSignUp: $showSignUp, isAuthenticated: $isAuthenticated)
                .environmentObject(authVM)
        } else {
            LoginView(showSignUp: $showSignUp, isAuthenticated: $isAuthenticated)
                .environmentObject(authVM)
        }
    }
}
