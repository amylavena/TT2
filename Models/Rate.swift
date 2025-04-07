import Foundation

struct Rate: Identifiable, Codable {
    let id: String
    let type: RateType
    let title: String
    let price: Int
    let duration: Int  // in minutes
    let description: String
    let additionalInfo: [String]
    let isPackage: Bool
    
    enum RateType: String, Codable {
        case onsite = "Onsite Coaching"
        case virtual = "Virtual Coaching"
        case text = "Text-Based Coaching"
        case call = "Call-Based Coaching"
        
        var icon: String {
            switch self {
            case .onsite: return "person.fill"
            case .virtual: return "video.fill"
            case .text: return "message.fill"
            case .call: return "phone.fill"
            }
        }
    }
} 