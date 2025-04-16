//
//  HomeView.swift
//  LiveEducationApp
//
//  Created by Bohdan Borysenko on 16.04.2025.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @State private var selectedCategory = "All"

    let categories = ["All", "UI/UX", "Illustration", "3D Animation"]
    let allCourses: [Course] = [
        Course(imageName: "sliderOne", title: "Design Sprint", duration: "5h 21m", lessons: "6 lessons", category: "UI/UX", authorName: "Laurel Seilha", authorRole: "Product Designer"),
        Course(imageName: "sliderTwo", title: "3D Basics", duration: "4h 10m", lessons: "5 lessons", category: "3D Animation", authorName: "Alex Render", authorRole: "Animator"),
        Course(imageName: "sliderThree", title: "Illustration Tips", duration: "3h 45m", lessons: "4 lessons", category: "Illustration", authorName: "Nina Draw", authorRole: "Illustrator")
    ]

    var filteredCourses: [Course] {
        selectedCategory == "All" ? allCourses : allCourses.filter { $0.category == selectedCategory }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // MARK: Header
                HStack {
                    Image("Avatar")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())

                    VStack(alignment: .leading) {
                        Text("Hallo, \(authVM.displayName.isEmpty ? "User" : authVM.displayName)!")
                            .font(.system(size: 18, weight: .semibold))
                        Text("+1600 Points")
                            .font(.subheadline)
                            .foregroundColor(.yellow)
                    }

                    Spacer()

                    Button(action: {}) {
                        ZStack {
                            Image(systemName: "bell")
                                .font(.system(size: 20))
                            Circle()
                                .fill(Color.red)
                                .frame(width: 10, height: 10)
                                .offset(x: 8, y: -8)
                        }
                    }
                }
                .padding(.horizontal)

                // MARK: Avatars
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(1...5, id: \.self) { i in
                            ZStack(alignment: .bottomTrailing) {
                                Image("avatar\(i)")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.red, lineWidth: 2))
                                Circle()
                                    .fill(.white)
                                    .frame(width: 20, height: 20)
                                    .overlay(
                                        Image(systemName: "video.fill")
                                            .font(.system(size: 10))
                                            .foregroundColor(.cyan)
                                    )
                            }
                        }
                    }
                    .padding(.horizontal)
                }

                // MARK: Section Title
                HStack {
                    Text("Upcoming ").bold() + Text("course of this week").foregroundColor(.gray)
                    Spacer()
                }
                .font(.system(size: 18))
                .padding(.horizontal)

                // MARK: Category Tabs
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(categories, id: \.self) { category in
                            Text(category)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(selectedCategory == category ? Color("PrimaryRed") : Color(.systemGray6))
                                .foregroundColor(selectedCategory == category ? .white : .gray)
                                .cornerRadius(16)
                                .onTapGesture {
                                    withAnimation {
                                        selectedCategory = category
                                    }
                                }
                        }
                    }
                    .padding(.horizontal)
                }

                // MARK: Courses Carousel
                NavigationView {
                    TabView {
                        ForEach(filteredCourses) { course in
                            NavigationLink(destination: CourseDetailView(course: course)) {
                                CourseCardView(course: course)
                                    .padding(.horizontal)
                            }
                        }
                    }
                    .frame(height: 400)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                }
            }
            .padding(.top)
        }
    }
}

#Preview {
    NavigationView {
        HomeView()
            .environmentObject(AuthViewModel())
    }
}
