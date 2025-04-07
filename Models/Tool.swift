import Foundation

struct Tool: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let category: ToolCategory
} 