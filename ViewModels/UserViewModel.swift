import SwiftUI

class UserViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var isAuthenticated = false
    @Published var isLoading = false
    
    init() {
        // For demo purposes, simulate a logged-in user
        self.currentUser = User(
            name: "John Smith",
            email: "john@example.com",
            profilePhotoURL: nil
        )
        self.isAuthenticated = true
    }
    
    func signIn(email: String, password: String) {
        isLoading = true
        
        // Simulate API call
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.currentUser = User(
                name: "John Smith",
                email: email,
                profilePhotoURL: nil
            )
            self.isAuthenticated = true
            self.isLoading = false
        }
    }
    
    func signOut() {
        isLoading = true
        
        // Simulate API call
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.currentUser = nil
            self.isAuthenticated = false
            self.isLoading = false
        }
    }
} 