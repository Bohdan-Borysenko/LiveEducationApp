//
//  Course.swift
//  LiveEducationApp
//
//  Created by Bohdan Borysenko on 16.04.2025.
//

import Foundation
import SwiftUI

struct Course: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let duration: String
    let lessons: String
    let category: String
    let authorName: String
    let authorRole: String
}
