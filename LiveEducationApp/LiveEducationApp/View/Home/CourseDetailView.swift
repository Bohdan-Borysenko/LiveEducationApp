//
//  CourseDetailView.swift
//  LiveEducationApp
//
//  Created by Bohdan Borysenko on 16.04.2025.
//

import Foundation
import SwiftUI

import SwiftUI

struct CourseDetailView: View {
    let course: Course
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // MARK: - Back Button
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.primary)
                        .padding(10)
                        .background(Color(.systemGray5))
                        .clipShape(Circle())
                        .shadow(radius: 1)
                }

                Text("Course Details")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.leading, 8)

                Spacer()
            }
            .padding()

            // MARK: - Course Content
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    Image(course.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
                        .cornerRadius(20)
                        .padding(.horizontal)

                    Text(course.title)
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)

                    Text("Duration: \(course.duration)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.horizontal)

                    Text("Category: \(course.category)")
                        .font(.subheadline)
                        .padding(.horizontal)

                    Text("Lessons: \(course.lessons)")
                        .font(.subheadline)
                        .padding(.horizontal)

                    Divider().padding(.horizontal)

                    HStack(spacing: 12) {
                        Image("userAvatar")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())

                        VStack(alignment: .leading) {
                            Text(course.authorName)
                                .font(.headline)
                            Text(course.authorRole)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom)
            }

            Spacer()
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    let course = Course(
        imageName: "sliderOne",
        title: "Design Sprint",
        duration: "5h 21m",
        lessons: "6 lessons",
        category: "UI/UX",
        authorName: "Laurel Seilha",
        authorRole: "Product Designer"
    )

    return CourseDetailView(course: course)
}
