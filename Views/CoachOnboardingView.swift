import SwiftUI

struct CoachOnboardingView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = CoachOnboardingViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                // Rest of the view code stays the same...
            }
        }
    }
} 