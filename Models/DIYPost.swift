import Foundation

struct DIYPost: Identifiable {
    let id = UUID()
    let influencerName: String
    let influencerHandle: String
    let profileImageURL: String
    let socialMediaPlatform: SocialMediaPlatform
    let projectTitle: String
    let projectDescription: String
    let projectImageURL: String
    let tools: [ProjectTool]
    let materials: [Material]
    let likes: Int
    let comments: Int
    
    enum SocialMediaPlatform {
        case instagram
        case tiktok
        case youtube
    }
}

struct ProjectTool: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
}

struct Material: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
} 