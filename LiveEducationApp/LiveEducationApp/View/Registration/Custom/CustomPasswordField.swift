//
//  CustomPasswordField.swift
//  LiveEducationApp
//
//  Created by Bohdan Borysenko on 12.04.2025.
//

import Foundation
import SwiftUI

struct CustomPasswordField: View {
    var placeholder: String
    @Binding var data: String
    @State private var isSecure: Bool = true

    var body: some View {
        HStack {
            if isSecure {
                SecureField("", text: $data, prompt: Text(placeholder).foregroundColor(.gray))
            } else {
                TextField("", text: $data, prompt: Text(placeholder).foregroundColor(.gray))
            }

            Button(action: {
                isSecure.toggle()
            }) {
                Image(systemName: isSecure ? "eye.slash" : "eye")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
        )
        .frame(height: 52)
    }
}

#Preview {
    CustomPasswordField(placeholder: "Password", data: .constant(""))
}
