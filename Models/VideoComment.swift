import Foundation

struct VideoComment: Identifiable {
    let id: UUID
    let authorId: String
    let authorName: String
    let authorPhotoURL: String
    let content: String
    let timestamp: Date
    let likes: Int
    var replies: [VideoComment]
    
    var timeAgo: String {
        // TODO: Implement time ago calculation
        "2h ago"
    }
} 