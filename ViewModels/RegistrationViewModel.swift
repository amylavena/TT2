import SwiftUI

enum UserRole {
    case coach
    case diyer
}

class RegistrationViewModel: ObservableObject {
    // Basic Information
    @Published var profileImage: UIImage?
    @Published var fullName = ""
    @Published var email = ""
    @Published var phoneNumber = ""
    @Published var password = ""
    @Published var selectedRole: UserRole?
    
    // UI State
    @Published var showPassword = false
    @Published var showImagePicker = false
    
    // Validation
    var isBasicInfoValid: Bool {
        !fullName.isEmpty &&
        isValidEmail(email) &&
        isValidPhoneNumber(phoneNumber) &&
        isValidPassword(password) &&
        selectedRole != nil
    }
    
    // Password Validation
    var hasUppercase: Bool {
        password.contains { $0.isUppercase }
    }
    
    var hasLowercase: Bool {
        password.contains { $0.isLowercase }
    }
    
    var hasNumber: Bool {
        password.contains { $0.isNumber }
    }
    
    // Helper Methods
    func sendVerification() {
        // TODO: Implement actual verification sending
        print("Sending verification to \(email)")
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    private func isValidPhoneNumber(_ phone: String) -> Bool {
        let phoneRegex = "^\\d{10}$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phonePredicate.evaluate(with: phone.filter { $0.isNumber })
    }
    
    private func isValidPassword(_ password: String) -> Bool {
        password.count >= 8 && hasUppercase && hasLowercase && hasNumber
    }
} 