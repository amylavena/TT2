import Foundation

struct VideoAnalytics {
    let videoId: String
    let views: Int
    let uniqueViewers: Int
    let averageWatchTime: TimeInterval
    let completionRate: Double
    let likes: Int
    let comments: Int
    let shares: Int
    let bookings: Int
    let revenue: Double
    let viewsByDate: [Date: Int]
    let viewsByRegion: [String: Int]
    let viewsByAge: [String: Int]
    let viewsByGender: [String: Int]
} 