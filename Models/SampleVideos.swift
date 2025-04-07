import Foundation

extension ProjectVideo {
    static let sampleVideos: [ProjectVideo] = [
        // Videos from coaches in SampleCoaches
        ProjectVideo(
            id: UUID(),
            creatorId: "1", // Paul's ID
            videoURL: "paul_woodworking_1",
            thumbnailURL: "paul_thumbnail_1",
            title: "Perfect Dovetail Joints",
            description: "Learn my secret technique for cutting perfect dovetails every time. This method has served me well for over 20 years.",
            category: .woodworking,
            duration: 180, // 3 minutes
            likes: 1240,
            views: 15000,
            commentCount: 156,
            createdAt: Date().addingTimeInterval(-86400 * 2), // 2 days ago
            coach: .paulSample,
            tags: ["woodworking", "joinery", "dovetails"],
            offersCoaching: true,
            hourlyRate: 75.0
        ),
        
        ProjectVideo(
            id: UUID(),
            creatorId: "2", // Mike's ID
            videoURL: "mike_storage_1",
            thumbnailURL: "mike_thumbnail_1",
            title: "Garage Organization Hack",
            description: "Transform your messy garage into an organized space with this simple weekend project.",
            category: .homeImprovement,
            duration: 240, // 4 minutes
            likes: 890,
            views: 10500,
            commentCount: 89,
            createdAt: Date().addingTimeInterval(-86400), // 1 day ago
            coach: Coach.sampleCoaches[1], // Mike
            tags: ["organization", "garage", "storage"],
            offersCoaching: true,
            hourlyRate: 65.0
        ),
        
        ProjectVideo(
            id: UUID(),
            creatorId: "3", // Sue's ID
            videoURL: "sue_pottery_1",
            thumbnailURL: "sue_thumbnail_1",
            title: "Beginner's Guide to Wheel Throwing",
            description: "Start your pottery journey with these essential techniques for centering clay.",
            category: .crafts,
            duration: 300, // 5 minutes
            likes: 2100,
            views: 25000,
            commentCount: 245,
            createdAt: Date().addingTimeInterval(-43200), // 12 hours ago
            coach: Coach.sampleCoaches[2], // Sue
            tags: ["pottery", "ceramics", "beginners"],
            offersCoaching: true,
            hourlyRate: 45.0
        )
    ]
} 