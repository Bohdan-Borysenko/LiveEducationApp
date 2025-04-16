//
//  InputFieldLoginView.swift
//  LiveEducationApp
//
//  Created by Bohdan Borysenko on 11.04.2025.
//

import SwiftUI

import SwiftUI

struct CustomInputField: View {
    var placeholder: String
    @Binding var data: String

    var body: some View {
        TextField("", text: $data, prompt: Text(placeholder).foregroundColor(.gray))
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
            )
            .frame(height: 52)
    }
}

#Preview {
    CustomInputField(placeholder: "Email", data: .constant(""))
}
