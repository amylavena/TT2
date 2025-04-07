import Foundation

// Project Models
struct Project: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let category: ProjectCategory
    let difficulty: ProjectDifficulty
    let estimatedTime: TimeInterval
    let materials: [String]
    let tools: [String]
    let thumbnailURL: String
    let steps: [ProjectInstruction]
    let isPremium: Bool
    let price: Double?
}

// ProjectInstruction Model (renamed to avoid ambiguity)
struct ProjectInstruction: Identifiable {
    let id = UUID()
    let step: Int
    let title: String
    let description: String
    let imageURLs: [String]
}

enum ProjectDifficulty: String, CaseIterable {
    case beginner = "Beginner"
    case intermediate = "Intermediate"
    case advanced = "Advanced"
} 
