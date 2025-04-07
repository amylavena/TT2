import Foundation

struct ProjectVideo: Identifiable {
    let id: UUID
    let creatorId: String
    let videoURL: String
    let thumbnailURL: String
    let title: String
    let description: String
    let category: ProjectCategory
    let duration: TimeInterval
    let likes: Int
    let views: Int
    let commentCount: Int
    let createdAt: Date
    let coach: Coach? // Optional link to coach profile if poster is a coach
    let tags: [String]
    
    // Coaching info
    let offersCoaching: Bool
    let hourlyRate: Double?
    
    // Engagement metrics
    var isLiked: Bool = false
    var isSaved: Bool = false
} 