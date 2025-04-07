import Foundation

enum ToolCategory: String, CaseIterable, Identifiable, CustomStringConvertible {
    case all = "All"
    case powerTools = "Power Tools"
    case handTools = "Hand Tools"
    case gardening = "Gardening"
    case woodworking = "Woodworking"
    case plumbing = "Plumbing"
    case electrical = "Electrical"
    case ladders = "Ladders"
    case cleaning = "Cleaning"
    case yardTools = "Yard Tools"
    case painting = "Painting"
    case automotive = "Automotive"
    case construction = "Construction"
    
    var id: String { rawValue }
    
    var description: String {
        rawValue
    }
    
    var iconName: String {
        switch self {
        case .all:
            return "square.grid.2x2"
        case .powerTools:
            return "bolt.fill"
        case .handTools:
            return "wrench.and.screwdriver"
        case .gardening:
            return "leaf.fill"
        case .woodworking:
            return "hammer.fill"
        case .plumbing:
            return "drop.fill"
        case .electrical:
            return "bolt.fill"
        case .ladders:
            return "ladder.fill"
        case .cleaning:
            return "wrench.and.bucket"
        case .yardTools:
            return "shovel.fill"
        case .painting:
            return "paintbrush.fill"
        case .automotive:
            return "car.fill"
        case .construction:
            return "hammer.fill"
        }
    }
} 