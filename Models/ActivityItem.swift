import Foundation

enum ActivityType {
    case newFollower
    case videoLike
    case videoComment
    case newVideo
    case coaching
    
    var icon: String {
        switch self {
        case .newFollower: return "person.fill.badge.plus"
        case .videoLike: return "heart.fill"
        case .videoComment: return "bubble.left.fill"
        case .newVideo: return "video.fill"
        case .coaching: return "person.2.fill"
        }
    }
}

struct ActivityItem: Identifiable {
    let id: UUID
    let type: ActivityType
    let userId: String
    let userName: String
    let userPhotoURL: String
    let timestamp: Date
    let videoId: String?
    let videoThumbnail: String?
    let message: String
    
    var timeAgo: String {
        // TODO: Implement proper time ago calculation
        "2h ago"
    }
} 