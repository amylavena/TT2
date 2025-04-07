import Foundation

struct EnhancedProject: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let creator: Creator
    let category: ProjectCategory
    let difficulty: ProjectDifficulty
    let estimatedTime: TimeInterval
    let images: [String]
    let materials: [ProjectMaterial]
    let tools: [Tool]
    let instructions: [ProjectInstruction]
    let isPremium: Bool
    let price: Double?
    let rating: Double
    let completions: Int
    let datePosted: Date
}

struct Creator: Identifiable {
    let id = UUID()
    let name: String
    let profileImage: String
    let rating: Double
    let projectsCount: Int
    let bio: String
}

struct ProjectMaterial: Identifiable {
    let id = UUID()
    let name: String
    let quantity: String
    let estimatedCost: Double
    let affiliateURL: URL?
    var hasAffiliateLink: Bool { affiliateURL != nil }
} 