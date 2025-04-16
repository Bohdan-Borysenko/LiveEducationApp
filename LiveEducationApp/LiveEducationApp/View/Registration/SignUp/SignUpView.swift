//
//  SignUp.swift
//  LiveEducationApp
//
//  Created by Bohdan Borysenko on 12.04.2025.
//

import SwiftUI

struct SignUpView: View {
    @State private var fullname: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    @Binding var showSignUp: Bool
    @Binding var isAuthenticated: Bool
    
    @EnvironmentObject var authVM: AuthViewModel

    var body: some View {
        VStack(spacing: 24) {
            Spacer().frame(height: 40)

            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)

            VStack(spacing: 16) {
                CustomInputField(placeholder: "Fullname", data: $fullname)
                CustomInputField(placeholder: "Email", data: $email)
                CustomPasswordField(placeholder: "Password", data: $password)
            }

            if let error = authVM.errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .font(.caption)
                    .multilineTextAlignment(.center)
                    .padding(.top, 5)
            }

            Button(action: {
                authVM.signUp(fullname: fullname, email: email, password: password) { result in
                    switch result {
                    case .success:
                        print("✅ Успешная регистрация")
                        isAuthenticated = true
                    case .failure(let error):
                        print("❌ Ошибка регистрации: \(error.localizedDescription)")
                    }
                }
            }) {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("PrimaryRed"))
                    .cornerRadius(8)
            }

            HStack {
                Rectangle().frame(height: 1).foregroundColor(.gray.opacity(0.3))
                Text("or").foregroundColor(.gray)
                Rectangle().frame(height: 1).foregroundColor(.gray.opacity(0.3))
            }

            SocialLoginButton(image: "facebook", text: "Log in with Facebook", bgColor: .blue, textColor: .white)
            SocialLoginButton(image: "google", text: "Log in with Google", bgColor: .white, textColor: .black)

            Text("By signing up you accept the Terms of Service and Privacy Policy")
                .font(.caption)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)

            HStack {
                Text("Already have an account?")
                Button("Log in") {
                    showSignUp = false
                }
                .foregroundColor(.blue)
            }
            .font(.footnote)

            Spacer()
        }
        .padding()
    }
}

#Preview {
    SignUpView(
        showSignUp: .constant(true),
        isAuthenticated: .constant(false)
    )
    .environmentObject(AuthViewModel())
}
