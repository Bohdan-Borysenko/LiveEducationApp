//
//  LoginView.swift
//  LiveEducationApp
//
//  Created by Bohdan Borysenko on 11.04.2025.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @Binding var showSignUp: Bool
    @Binding var isAuthenticated: Bool
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        VStack(spacing: 24) {
            Spacer().frame(height: 40)

            // Логотип
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .padding(.bottom, 30)

            // Поля ввода
            VStack(spacing: 16) {
                CustomInputField(placeholder: "Email", data: $email)
                CustomPasswordField(placeholder: "Password", data: $password)
            }

            // Ошибка
            if let error = authVM.errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .font(.caption)
                    .multilineTextAlignment(.center)
                    .padding(.top, 5)
            }

            // Кнопка входа
            // Кнопка входа
            Button(action: {
                authVM.signIn(email: email, password: password) { result in
                    switch result {
                    case .success:
                        print("✅ Вход выполнен")
                        isAuthenticated = true // 👉 Добавь ЭТО
                    case .failure(let error):
                        print("❌ Ошибка входа: \(error.localizedDescription)")
                    }
                }
            }) {
                Text("Log in")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("PrimaryRed"))
                    .cornerRadius(8)
            }

            // Забыли пароль
            Button(action: {}) {
                Text("Forgot Password?")
                    .font(.footnote)
                    .foregroundColor(.blue)
            }

            // Разделитель
            HStack {
                Rectangle().frame(height: 1).foregroundColor(.gray.opacity(0.3))
                Text("or").foregroundColor(.gray)
                Rectangle().frame(height: 1).foregroundColor(.gray.opacity(0.3))
            }

            // Соц. кнопки
            SocialLoginButton(image: "facebook", text: "Log in with Facebook", bgColor: .blue, textColor: .white)
            SocialLoginButton(image: "google", text: "Log in with Google", bgColor: .white, textColor: .black)

            // Регистрация
            HStack {
                Text("Don't have an account?")
                Button("Sign Up") {
                    showSignUp = true
                }.foregroundColor(.blue)
            }
            .font(.footnote)
            .padding(.top, 90)

            Spacer()
        }
        .padding()
    }
}

#Preview {
    LoginView(showSignUp: .constant(false), isAuthenticated: .constant(false))
        .environmentObject(AuthViewModel())
}
