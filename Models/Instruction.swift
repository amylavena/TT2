import Foundation

struct Instruction: Identifiable {
    let id = UUID()
    let step: Int
    let title: String
    let description: String
    let imageURLs: [String]
} 