import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var profilePhotoURL: String?
    @Published var newProfileImage: UIImage?
    @Published var name = ""
    @Published var bio = ""
    @Published var email = ""
    @Published var isCoach = false
    @Published var isAvailableForCoaching = false
    @Published var hourlyRate: Double = 0.0
    
    // Notification Settings
    @Published var notifyOnComments = true
    @Published var notifyOnFollowers = true
    @Published var notifyOnMessages = true
    
    // Privacy Settings
    @Published var isPrivateAccount = false
    @Published var showActivityStatus = true
    
    init() {
        loadCurrentSettings()
    }
    
    private func loadCurrentSettings() {
        // TODO: Load from UserDefaults or backend
        let currentUser = UserDefaults.standard.string(forKey: "currentUser")
        name = "John Smith"
        email = "john@example.com"
        bio = "DIY enthusiast and woodworking hobbyist"
        isCoach = true
    }
    
    func saveChanges() async {
        // TODO: Implement actual save functionality
        if let newImage = newProfileImage {
            // Upload new profile image
            await uploadProfileImage(newImage)
        }
        
        // Save other settings
        UserDefaults.standard.set(name, forKey: "userName")
        UserDefaults.standard.set(email, forKey: "userEmail")
        UserDefaults.standard.set(bio, forKey: "userBio")
    }
    
    private func uploadProfileImage(_ image: UIImage) async {
        // TODO: Implement image upload
    }
    
    func logout() {
        // TODO: Implement logout functionality
        UserDefaults.standard.removeObject(forKey: "currentUser")
        // Post notification for app to show login screen
    }
} 