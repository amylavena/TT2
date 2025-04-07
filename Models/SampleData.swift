import Foundation

extension EnhancedProject {
    static let sampleProjects = [
        EnhancedProject(
            title: "Modern Coffee Table",
            description: "Build a sleek, modern coffee table perfect for any living room. This project combines style with functionality, featuring clean lines and ample storage.",
            creator: Creator.sampleCreator,
            category: ProjectCategory.woodworking,
            difficulty: ProjectDifficulty.intermediate,
            estimatedTime: 21600,
            images: [
                "coffee_table_1",
                "coffee_table_2",
                "coffee_table_3"
            ],
            materials: [
                ProjectMaterial(
                    name: "Oak Wood Planks",
                    quantity: "4 pieces (6ft x 1ft)",
                    estimatedCost: 120.00,
                    affiliateURL: URL(string: "https://example.com/oak-planks")
                ),
                ProjectMaterial(
                    name: "Wood Stain (Dark Walnut)",
                    quantity: "1 quart",
                    estimatedCost: 15.99,
                    affiliateURL: URL(string: "https://example.com/wood-stain")
                ),
                ProjectMaterial(
                    name: "Wood Screws",
                    quantity: "24 pieces",
                    estimatedCost: 8.99,
                    affiliateURL: URL(string: "https://example.com/screws")
                )
            ],
            tools: [
                Tool(
                    name: "Power Drill",
                    description: "For driving screws and drilling pilot holes",
                    category: .powerTools
                ),
                Tool(
                    name: "Circular Saw",
                    description: "For cutting wood",
                    category: .powerTools
                ),
                Tool(
                    name: "Sander",
                    description: "For sanding wood",
                    category: .powerTools
                )
            ],
            instructions: [
                ProjectInstruction(
                    step: 1,
                    title: "Prepare the Wood",
                    description: "Cut the oak planks to size according to the provided measurements. Sand all surfaces thoroughly.",
                    imageURLs: ["step1_1", "step1_2"]
                ),
                ProjectInstruction(
                    step: 2,
                    title: "Assembly",
                    description: "Join the pieces together using wood screws and glue. Make sure everything is square.",
                    imageURLs: ["step2_1", "step2_2"]
                )
            ],
            isPremium: true,
            price: 14.99,
            rating: 4.8,
            completions: 127,
            datePosted: Date()
        )
    ]
    
    static let sampleProject = sampleProjects[0]
}

extension Creator {
    static let sampleCreator = Creator(
        name: "John Gombert",
        profileImage: "profile_1",
        rating: 4.9,
        projectsCount: 15,
        bio: "Professional woodworker with 10 years of experience. Specializing in modern furniture design."
    )
}

extension ProjectComment {
    static let sampleComments = [
        ProjectComment(
            userName: "Amy",
            userPhotoURL: "user_1",
            content: "Great project! The instructions were very clear.",
            date: Date().addingTimeInterval(-86400),
            likes: 12,
            replies: []
        ),
        ProjectComment(
            userName: "Mike",
            userPhotoURL: "user_2",
            content: "Made this last weekend. Turned out amazing!",
            date: Date().addingTimeInterval(-172800),
            likes: 8,
            replies: [
                ProjectComment(
                    userName: "John Woodworker",
                    userPhotoURL: "profile_1",
                    content: "Glad you enjoyed it! Would love to see photos.",
                    date: Date().addingTimeInterval(-86400),
                    likes: 3,
                    replies: []
                )
            ]
        )
    ]
} 
