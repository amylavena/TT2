import SwiftUI

struct BookingsView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image(systemName: "calendar")
                    .font(.system(size: 48))
                    .foregroundColor(Color.theme.primary)
                
                Text("No Bookings Yet")
                    .font(.headline)
                
                Text("Your upcoming sessions will appear here")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding()
            .navigationTitle("Sessions")
        }
    }
}

struct BookingsView_Previews: PreviewProvider {
    static var previews: some View {
        BookingsView()
    }
} 