import Foundation

struct ProjectComment: Identifiable {
    let id = UUID()
    let userName: String
    let userPhotoURL: String
    let content: String
    let date: Date
    let likes: Int
    let replies: [ProjectComment]
} 