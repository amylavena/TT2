import SwiftUI

struct StatsBar: View {
    let profile: UserProfile?
    
    var body: some View {
        HStack(spacing: 24) {
            StatItem(title: "Videos", count: profile?.videosCount ?? 0)
            StatItem(title: "Followers", count: profile?.followersCount ?? 0)
            StatItem(title: "Following", count: profile?.followingCount ?? 0)
        }
        .padding()
        .background(Color.theme.cardBackground)
        .cornerRadius(12)
    }
}

struct StatItem: View {
    let title: String
    let count: Int
    
    var body: some View {
        VStack(spacing: 4) {
            Text("\(count)")
                .font(.headline)
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
} 