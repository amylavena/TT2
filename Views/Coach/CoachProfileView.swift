import SwiftUI

struct CoachProfileView: View {
    let coach: Coach
    @State private var selectedTab = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Profile Header
                VStack(spacing: 16) {
                    AsyncImage(url: URL(string: coach.imageURL)) { image in
                        image.resizable()
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    
                    Text(coach.name)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    HStack {
                        Label("\(coach.rating, specifier: "%.1f")", systemImage: "star.fill")
                        Text("•")
                        Text("\(coach.reviewCount) reviews")
                    }
                    .foregroundColor(.gray)
                }
                
                // Stats
                HStack(spacing: 24) {
                    StatView(title: "Rate", value: "$\(coach.hourlyRate)/hr")
                    StatView(title: "Projects", value: "\(coach.projectTypes.count)")
                    StatView(title: "Experience", value: "5+ years")
                }
                
                // About
                VStack(alignment: .leading, spacing: 12) {
                    Text("About")
                        .font(.headline)
                    Text(coach.description ?? "No description available")
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                
                // Expertise
                VStack(alignment: .leading, spacing: 12) {
                    Text("Expertise")
                        .font(.headline)
                    
                    FlowLayout(
                        spacing: 8,
                        data: coach.expertise
                    ) { skill in
                        Text(skill)
                            .font(.subheadline)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.theme.primary.opacity(0.1))
                            .foregroundColor(Color.theme.primary)
                            .cornerRadius(16)
                    }
                }
                .padding(.horizontal)
                
                // Rates
                VStack(alignment: .leading, spacing: 16) {
                    Text("Coaching Options")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    // Regular Rates
                    ForEach(coach.rates.filter { !$0.isPackage }) { rate in
                        RateCard(rate: rate)
                    }
                    
                    // Package Rates
                    ForEach(coach.rates.filter { $0.isPackage }) { rate in
                        PackageCard(package: rate)
                    }
                }
            }
            .padding(.vertical)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct StatView: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            Text(value)
                .font(.headline)
        }
    }
}
