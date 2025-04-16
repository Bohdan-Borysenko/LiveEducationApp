//
//  SocialLoginButton.swift
//  LiveEducationApp
//
//  Created by Bohdan Borysenko on 12.04.2025.
//

import Foundation
import SwiftUI

struct SocialLoginButton: View {
    var image: String
    var text: String
    var bgColor: Color
    var textColor: Color

    var body: some View {
        HStack(spacing: 12) {
            Image(image)
                .resizable()
                .frame(width: 24, height: 24)
                .clipShape(Circle())

            Text(text)
                .foregroundColor(textColor)
                .fontWeight(.medium)

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(bgColor)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
    }
}

#Preview {
    VStack(spacing: 16) {
        SocialLoginButton(image: "google", text: "Log in with Google", bgColor: .white, textColor: .black)

        SocialLoginButton(image: "facebook", text: "Log in with Facebook", bgColor: .blue, textColor: .white)
    }
    .padding()
    .background(Color.gray.opacity(0.1))
}
