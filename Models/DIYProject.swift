import Foundation

struct DIYProject: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let category: ProjectCategory
    let difficulty: DIYProject.ProjectDifficulty
    let estimatedTime: TimeInterval
    let materials: [String]
    let tools: [String]
    let thumbnailURL: String
    let isPremium: Bool
    let price: Double?
    let rating: Double
    let completions: Int
    
    // Nested ProjectDifficulty enum
    enum ProjectDifficulty: String, CaseIterable {
        case beginner = "Beginner"
        case intermediate = "Intermediate"
        case advanced = "Advanced"
    }
    
    init(
        title: String,
        description: String,
        category: ProjectCategory,
        difficulty: DIYProject.ProjectDifficulty,
        estimatedTime: TimeInterval,
        materials: [String],
        tools: [String],
        thumbnailURL: String,
        isPremium: Bool = false,
        price: Double? = nil,
        rating: Double = 0.0,
        completions: Int = 0
    ) {
        self.title = title
        self.description = description
        self.category = category
        self.difficulty = difficulty
        self.estimatedTime = estimatedTime
        self.materials = materials
        self.tools = tools
        self.thumbnailURL = thumbnailURL
        self.isPremium = isPremium
        self.price = price
        self.rating = rating
        self.completions = completions
    }
} 