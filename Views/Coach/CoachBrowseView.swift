import SwiftUI

struct CoachBrowseView: View {
    var body: some View {
        NavigationView {
            List(Coach.sampleCoaches) { coach in
                NavigationLink(destination: CoachProfileView(coach: coach)) {
                    CoachRow(coach: coach)
                }
            }
            .navigationTitle("Find a Coach")
        }
    }
}

struct CoachRow: View {
    let coach: Coach
    
    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: URL(string: coach.imageURL)) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .frame(width: 60, height: 60)
            .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(coach.name)
                    .font(.headline)
                Text(coach.category.rawValue)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 8)
    }
} 