import SwiftUI

class OnboardingViewModel: ObservableObject {
    @Published var selectedUserType: UserType?
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var phoneNumber = ""
    @Published var password = ""
    @Published var preferredLanguage = ""
    @Published var zipCode = ""
    @Published var agreedToTerms = false
    @Published var isLoading = false
    @Published var profileImage: UIImage?
    @Published var showImagePicker = false
    
    var isBasicInfoValid: Bool {
        !firstName.isEmpty &&
        !lastName.isEmpty &&
        !email.isEmpty &&
        !phoneNumber.isEmpty &&
        !password.isEmpty
    }
    
    func sendVerification() {
        isLoading = true
        
        // Simulate API call
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.isLoading = false
            // In a real app, this would send a verification code
            print("Sending verification to \(self.email)")
        }
    }
    
    func completeRegistration() {
        isLoading = true
        
        // Simulate API call
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.isLoading = false
            // In a real app, this would create the user account
            print("Completing registration for \(self.firstName) \(self.lastName)")
        }
    }
} 