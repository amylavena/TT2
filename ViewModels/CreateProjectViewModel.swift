import SwiftUI

class CreateProjectViewModel: ObservableObject {
    @Published var title = ""
    @Published var description = ""
    @Published var category: ProjectCategory = .woodworking
    @Published var difficulty: ProjectDifficulty = .beginner
    @Published var estimatedTime: TimeInterval = 3600
    @Published var materials: [ProjectMaterial] = []
    @Published var tools: [Tool] = []
    @Published var instructions: [ProjectInstruction] = []
    @Published var isPremium = false
    @Published var price: Double?
    @Published var isPublishing = false
    @Published var showError = false
    @Published var errorMessage = ""
    
    func canProceedToNextStep(from step: Int) -> Bool {
        switch step {
        case 0:
            return !title.isEmpty && !description.isEmpty
        case 1:
            return !materials.isEmpty && !tools.isEmpty
        case 2:
            return !instructions.isEmpty
        case 3:
            return !isPublishing
        default:
            return false
        }
    }
    
    func saveDraft() {
        // TODO: Implement draft saving
    }
    
    func publishProject() {
        isPublishing = true
        // TODO: Implement project publishing
    }
} 