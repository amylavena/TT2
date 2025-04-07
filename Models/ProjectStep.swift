import Foundation

struct ProjectStep: Identifiable {
    let id = UUID()
    let orderNumber: Int
    let title: String
    let description: String
    let images: [String]
    let estimatedTime: TimeInterval
    let tips: [String]
} 