import Foundation

enum ProjectCategory: String, CaseIterable, Identifiable, CustomStringConvertible, Codable {
    case all = "All"
    case woodworking = "Woodworking"
    case homeImprovement = "Home Improvement"
    case gardening = "Gardening"
    case electrical = "Electrical"
    case plumbing = "Plumbing"
    case automotive = "Automotive"
    case crafts = "Arts & Crafts"
    case culinary = "Culinary Arts"
    
    var id: Self { self }
    
    var description: String { rawValue }
    
    var iconName: String {
        switch self {
        case .all:
            return "square.grid.2x2"
        case .woodworking:
            return "hammer.fill"
        case .homeImprovement:
            return "house.fill"
        case .gardening:
            return "leaf.fill"
        case .electrical:
            return "bolt.fill"
        case .plumbing:
            return "drop.fill"
        case .automotive:
            return "car.fill"
        case .crafts:
            return "paintbrush.fill"
        case .culinary:
            return "fork.knife"
        }
    }
    
    var detailedDescription: String {
        switch self {
        case .all:
            return "Browse all categories"
        case .woodworking:
            return "Create beautiful furniture and wooden items"
        case .homeImprovement:
            return "Upgrade and repair your living space"
        case .gardening:
            return "Design and maintain outdoor spaces"
        case .electrical:
            return "Electrical installations and repairs"
        case .plumbing:
            return "Plumbing installations and repairs"
        case .automotive:
            return "Vehicle maintenance and repair"
        case .crafts:
            return "Express creativity through various arts"
        case .culinary:
            return "Cooking, baking, and food preparation"
        }
    }
}