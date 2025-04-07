import SwiftUI

struct CustomTextField: View {
    let title: String
    @Binding var text: String
    var placeholder: String = ""
    var keyboardType: UIKeyboardType = .default
    var autocapitalization: TextInputAutocapitalization = .sentences
    var isSecure: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(Color.theme.textSecondary)
            
            if isSecure {
                SecureField(placeholder, text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(keyboardType)
                    .textInputAutocapitalization(autocapitalization)
            } else {
                TextField(placeholder, text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(keyboardType)
                    .textInputAutocapitalization(autocapitalization)
            }
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            CustomTextField(
                title: "Name",
                text: .constant(""),
                placeholder: "Enter your name"
            )
            
            CustomTextField(
                title: "Email",
                text: .constant(""),
                placeholder: "Enter your email",
                keyboardType: .emailAddress,
                autocapitalization: .never
            )
            
            CustomTextField(
                title: "Password",
                text: .constant(""),
                placeholder: "Enter your password",
                autocapitalization: .never,
                isSecure: true
            )
        }
        .padding()
    }
} 