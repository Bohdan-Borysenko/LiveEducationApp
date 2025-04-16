//
//  CustomTabBar.swift
//  LiveEducationApp
//
//  Created by Bohdan Borysenko on 16.04.2025.
//

import Foundation
import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Tab

    var body: some View {
        HStack {
            tabButton(.home, image: "square.grid.2x2.fill")
            tabButton(.explore, image: "location.circle")
            ZStack {
                tabButton(.notifications, image: "envelope")
                // Бейдж
                Text("2")
                    .font(.caption2)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color.red)
                    .clipShape(Circle())
                    .offset(x: 10, y: -10)
            }
            tabButton(.profile, image: "person")
        }
        .padding(.vertical, 12)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 0))
        .shadow(color: Color.black.opacity(0.05), radius: 5, y: -2)
    }

    private func tabButton(_ tab: Tab, image: String) -> some View {
        VStack(spacing: 4) {
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .frame(width: 22, height: 22)
                .foregroundColor(selectedTab == tab ? Color("PrimaryRed") : Color.gray.opacity(0.5))
            
            if selectedTab == tab {
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color("PrimaryRed"))
                    .frame(width: 16, height: 4)
            } else {
                Color.clear.frame(height: 4)
            }
        }
        .frame(maxWidth: .infinity)
        .onTapGesture {
            withAnimation(.easeInOut) {
                selectedTab = tab
            }
        }
    }
}
