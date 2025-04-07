import SwiftUI

class CoachOnboardingViewModel: ObservableObject {
    @Published var selectedCategories: Set<ProjectCategory> = []
    @Published var expertise: [String] = []
    @Published var projectTypes: [String] = []
    @Published var interests: [String] = []
    @Published var skills: [String] = []
    @Published var description = ""
    @Published var hourlyRate = ""
    @Published var isAvailable = true
    @Published var availableFrom = Date()
    
    var isValidProfile: Bool {
        !selectedCategories.isEmpty &&
        !expertise.isEmpty &&
        !skills.isEmpty &&
        !description.isEmpty &&
        !hourlyRate.isEmpty &&
        Double(hourlyRate) != nil
    }
    
    func createCoach(withId id: String, name: String) -> Coach {
        Coach(
            id: id,
            name: name,
            category: selectedCategories.first ?? .all,
            rating: 0.0,
            reviewCount: 0,
            hourlyRate: Int(hourlyRate) ?? 0,
            expertise: expertise,
            projectTypes: projectTypes,
            interests: interests,
            skills: skills,
            description: description,
            imageURL: "default_profile",
            reviews: [],
            rates: [
                Rate(
                    id: UUID().uuidString,
                    type: .virtual,
                    title: "Initial Consultation",
                    price: Int(hourlyRate) ?? 0,
                    duration: 30,
                    description: "Initial consultation to discuss your project",
                    additionalInfo: [],
                    isPackage: false
                )
            ],
            projectPhotos: [],
            instagramPhotos: [],
            profileImage: "default_profile"
        )
    }
    
    func binding(for category: ProjectCategory) -> Binding<Bool> {
        Binding(
            get: { self.selectedCategories.contains(category) },
            set: { isSelected in
                if isSelected {
                    self.selectedCategories.insert(category)
                } else {
                    self.selectedCategories.remove(category)
                }
            }
        )
    }
} 
