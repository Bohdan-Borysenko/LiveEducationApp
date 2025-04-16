//
//  ProfileView.swift
//  LiveEducationApp
//
//  Created by Bohdan Borysenko on 16.04.2025.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Spacer().frame(height: 40)

            // Фото пользователя
            Button(action: {
                showImagePicker.toggle()
            }) {
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                } else {
                    Image("userAvatar")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                }
            }

            // Имя пользователя
            Text(authVM.displayName.isEmpty ? "User" : authVM.displayName)
                .font(.title2)
                .fontWeight(.semibold)

            // Переключатель темы
            Toggle(isOn: $isDarkMode) {
                Text("Dark Mode")
            }
            .padding(.horizontal)

            // Кнопка выхода
            Button(action: {
                authVM.signOut()
            }) {
                Text("Sign Out")
                    .foregroundColor(.red)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
            }

            Spacer()
        }
        .padding()
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $selectedImage)
        }
    }
}

#Preview {
    let mock = AuthViewModel()
    mock.displayName = "Bohdan"
    
    return ProfileView()
        .environmentObject(mock)
}
