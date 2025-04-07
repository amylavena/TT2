import SwiftUI

struct VerificationView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: OnboardingViewModel
    @State private var verificationCode = ""
    @State private var showUserTypeSelection = false
    
    var body: some View {
        VStack(spacing: 24) {
            // Header
            VStack(spacing: 8) {
                Text("Verify Your Email")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("We've sent a verification code to your email")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            
            // Verification Code Input
            VStack(spacing: 16) {
                CustomTextField(
                    title: "Verification Code",
                    text: $verificationCode,
                    placeholder: "Enter code",
                    keyboardType: .numberPad
                )
                
                Button(action: {
                    viewModel.sendVerification()
                }) {
                    Text("Resend Code")
                        .font(.subheadline)
                        .foregroundColor(Color.theme.primary)
                }
            }
            
            Spacer()
            
            // Continue Button
            Button(action: {
                showUserTypeSelection = true
            }) {
                Text("Continue")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(!verificationCode.isEmpty ? Color.theme.primary : Color.gray)
                    .cornerRadius(25)
            }
            .disabled(verificationCode.isEmpty)
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .foregroundColor(.primary)
                }
            }
        }
        .sheet(isPresented: $showUserTypeSelection) {
            UserTypeSelectionView()
                .environmentObject(viewModel)
        }
    }
}

struct VerificationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VerificationView()
                .environmentObject(OnboardingViewModel())
        }
    }
} 