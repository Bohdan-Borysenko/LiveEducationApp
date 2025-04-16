//
//  CourseCardView.swift
//  LiveEducationApp
//
//  Created by Bohdan Borysenko on 16.04.2025.
//

import SwiftUI

struct CourseCardView: View {
    let course: Course

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .topLeading) {
                Image(course.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 180)
                    .cornerRadius(24)

                Text("Free e-book")
                    .font(.caption)
                    .padding(6)
                    .background(Color.yellow)
                    .cornerRadius(8)
                    .padding(8)
            }

            Text(course.title)
                .font(.headline)

            HStack(spacing: 4) {
                Image(systemName: "clock")
                Text(course.duration)
                    .font(.subheadline)
            }
            .foregroundColor(.gray)

            HStack(spacing: 8) {
                Label(course.lessons, systemImage: "book")
                    .font(.caption)
                    .padding(6)
                    .background(Color.green.opacity(0.2))
                    .cornerRadius(6)

                Text(course.category)
                    .font(.caption)
                    .padding(6)
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(6)

                Text("Free")
                    .font(.caption)
                    .padding(6)
                    .background(Color.purple.opacity(0.2))
                    .cornerRadius(6)
            }

            HStack(spacing: 8) {
                Image("userAvatar")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .clipShape(Circle())

                VStack(alignment: .leading, spacing: 2) {
                    Text(course.authorName)
                        .font(.caption)
                        .bold()
                    Text(course.authorRole)
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
            }
        }
        .frame(width: 300, height: 380)
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}

#Preview {
    CourseCardView(course: Course(
        imageName: "sliderOne",
        title: "Sample",
        duration: "5h",
        lessons: "6 lessons",
        category: "UI/UX",
        authorName: "Bohdan",
        authorRole: "Designer"
    ))
}
