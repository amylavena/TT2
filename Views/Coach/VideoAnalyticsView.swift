import SwiftUI
import Charts

struct VideoAnalyticsView: View {
    let video: ProjectVideo
    @StateObject private var viewModel = VideoAnalyticsViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Overview Cards
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 16) {
                    AnalyticCard(title: "Views", value: "\(viewModel.analytics?.views ?? 0)")
                    AnalyticCard(title: "Likes", value: "\(viewModel.analytics?.likes ?? 0)")
                    AnalyticCard(title: "Comments", value: "\(viewModel.analytics?.comments ?? 0)")
                    AnalyticCard(title: "Bookings", value: "\(viewModel.analytics?.bookings ?? 0)")
                }
                
                // Views Over Time
                VStack(alignment: .leading, spacing: 16) {
                    Text("Views Over Time")
                        .font(.headline)
                    
                    if let analytics = viewModel.analytics {
                        Chart(analytics.viewsByDate.sorted(by: { $0.key < $1.key }), id: \.key) {
                            LineMark(
                                x: .value("Date", $0.key),
                                y: .value("Views", $0.value)
                            )
                        }
                        .frame(height: 200)
                    }
                }
                .padding()
                .background(Color.theme.cardBackground)
                .cornerRadius(12)
                
                // Audience Demographics
                DemographicsSection(analytics: viewModel.analytics)
                
                // Engagement Metrics
                EngagementSection(analytics: viewModel.analytics)
                
                // Revenue
                if let analytics = viewModel.analytics {
                    RevenueSection(revenue: analytics.revenue, bookings: analytics.bookings)
                }
            }
            .padding()
        }
        .navigationTitle("Analytics")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AnalyticCard: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.theme.cardBackground)
        .cornerRadius(12)
    }
} 