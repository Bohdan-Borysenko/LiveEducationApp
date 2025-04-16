//
//  TabBar.swift
//  LiveEducationApp
//
//  Created by Bohdan Borysenko on 11.04.2025.
//

import Foundation
import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: Tab = .home

    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case .home: HomeView()
                case .explore: ExploreView()
                case .notifications: NotificationsView()
                case .profile: ProfileView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            CustomTabBar(selectedTab: $selectedTab)
        }
        .ignoresSafeArea(.keyboard) 
    }
}

enum Tab {
    case home, explore, notifications, profile
}

#Preview {
    MainTabView()
}
