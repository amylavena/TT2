import SwiftUI

struct UserTypeSelectionView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: OnboardingViewModel
    @EnvironmentObject var appState: AppState
    @State private var showWelcomeScreen = false
    @State private var showCoachOnboarding = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Base background color
                Color(red: 0.75, green: 0.70, blue: 0.65)
                    .ignoresSafeArea()
                
                // Gradient overlay
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 0.18, green: 0.20, blue: 0.16).opacity(0.90), location: 0.00),
                        Gradient.Stop(color: Color(red: 0.25, green: 0.28, blue: 0.22).opacity(0.85), location: 0.30),
                        Gradient.Stop(color: Color(red: 0.32, green: 0.34, blue: 0.28).opacity(0.80), location: 0.60),
                        Gradient.Stop(color: Color(red: 0.38, green: 0.36, blue: 0.32).opacity(0.75), location: 1.00),
                    ],
                    startPoint: UnitPoint(x: 0.71, y: 1.29),
                    endPoint: UnitPoint(x: 1.29, y: 0.29)
                )
                .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Welcome to TaskTutor")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("Let's begin by telling us a little bit\nmore about you.")
                            .font(.body)
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .padding(.top, 40)
                    
                    // Selection Buttons
                    VStack(spacing: 16) {
                        Button(action: {
                            viewModel.selectedUserType = .diyer
                            showWelcomeScreen = true
                        }) {
                            Text("I'm a DIYer seeking a coach for\na project")
                                .font(.body)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(12)
                        }
                        .foregroundColor(.primary)
                        
                        Button(action: {
                            viewModel.selectedUserType = .coach
                            showCoachOnboarding = true
                        }) {
                            Text("I'm a professional looking to support\nDIYers with my expertise")
                                .font(.body)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(12)
                        }
                        .foregroundColor(.primary)
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .navigationDestination(isPresented: $showWelcomeScreen) {
                WelcomeScreenView()
                    .environmentObject(viewModel)
                    .environmentObject(appState)
            }
            .navigationDestination(isPresented: $showCoachOnboarding) {
                CoachOnboardingView()
                    .environmentObject(viewModel)
            }
        }
    }
}

struct SelectionCard: View {
    let title: String
    let subtitle: String
    let icon: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 20) {
                Image(systemName: icon)
                    .font(.title)
                    .foregroundColor(isSelected ? Color.theme.primary : .white)
                    .frame(width: 44)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.headline)
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(isSelected ? .secondary : .white.opacity(0.8))
                }
                
                Spacer()
                
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(Color.theme.primary)
                }
            }
            .padding()
            .background(isSelected ? .white : Color.white.opacity(0.2))
            .cornerRadius(16)
        }
    }
}

struct UserTypeSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        UserTypeSelectionView()
            .environmentObject(OnboardingViewModel())
            .environmentObject(AppState())
    }
} 