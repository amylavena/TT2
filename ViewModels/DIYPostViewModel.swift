import Foundation

class DIYPostViewModel: ObservableObject {
    @Published var posts: [DIYPost] = []
    
    init() {
        loadSamplePosts()
    }
    
    private func loadSamplePosts() {
        posts = [
            DIYPost(
                influencerName: "Amy's DIY",
                influencerHandle: "@Amysdiy",
                profileImageURL: "profile_1",
                socialMediaPlatform: .instagram,
                projectTitle: "Modern Coffee Table",
                projectDescription: "Build this sleek coffee table with basic tools",
                projectImageURL: "project_1",
                tools: [
                    ProjectTool(name: "Circular Saw", price: 129.99),
                    ProjectTool(name: "Power Drill", price: 89.99)
                ],
                materials: [
                    Material(name: "Oak Wood", price: 75.00),
                    Material(name: "Wood Stain", price: 15.99)
                ],
                likes: 1234,
                comments: 89
            ),
            
            DIYPost(
                influencerName: "DIY Master",
                influencerHandle: "@diymaster",
                profileImageURL: "profile_2",
                socialMediaPlatform: .youtube,
                projectTitle: "Floating Shelves",
                projectDescription: "Easy-to-make floating shelves for any room",
                projectImageURL: "project_2",
                tools: [
                    ProjectTool(name: "Level", price: 24.99),
                    ProjectTool(name: "Drill", price: 89.99)
                ],
                materials: [
                    Material(name: "Pine Wood", price: 45.00),
                    Material(name: "Brackets", price: 12.99)
                ],
                likes: 856,
                comments: 45
            )
        ]
    }
} 
