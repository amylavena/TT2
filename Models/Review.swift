import Foundation

struct Review: Identifiable, Codable {
    let id: String
    let authorName: String
    let date: Date
    let rating: Int
    let comment: String
    let isVerified: Bool
} 