import Foundation

struct UserProfile: Identifiable {
    let id: String
    var name: String
    var photoURL: String
    var bio: String
    var isCoach: Bool
    var followersCount: Int
    var followingCount: Int
    var videosCount: Int
    var isFollowed: Bool
} 