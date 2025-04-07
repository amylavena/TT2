import Foundation

struct User: Identifiable {
    let id: String
    let name: String
    let email: String
    let profilePhotoURL: String?
    let bio: String
    
    init(id: String = UUID().uuidString, name: String, email: String, profilePhotoURL: String?, bio: String = "") {
        self.id = id
        self.name = name
        self.email = email
        self.profilePhotoURL = profilePhotoURL
        self.bio = bio
    }
} 