import SwiftUI
import Charts

struct DemographicsSection: View {
    let analytics: VideoAnalytics?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Audience Demographics")
                .font(.headline)
            
            if let analytics = analytics {
                // Age Distribution
                PieChartView(data: analytics.viewsByAge)
                
                // Gender Distribution
                PieChartView(data: analytics.viewsByGender)
                
                // Region Distribution
                PieChartView(data: analytics.viewsByRegion)
            }
        }
        .padding()
        .background(Color.theme.cardBackground)
        .cornerRadius(12)
    }
}

struct EngagementSection: View {
    let analytics: VideoAnalytics?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Engagement")
                .font(.headline)
            
            if let analytics = analytics {
                EngagementRow(title: "Average Watch Time", value: formatTime(analytics.averageWatchTime))
                EngagementRow(title: "Completion Rate", value: "\(Int(analytics.completionRate * 100))%")
                EngagementRow(title: "Unique Viewers", value: "\(analytics.uniqueViewers)")
            }
        }
        .padding()
        .background(Color.theme.cardBackground)
        .cornerRadius(12)
    }
    
    private func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return "\(minutes)m \(seconds)s"
    }
}

struct RevenueSection: View {
    let revenue: Double
    let bookings: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Revenue")
                .font(.headline)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Total Revenue")
                        .font(.subheadline)
                    Text("$\(String(format: "%.2f", revenue))")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Total Bookings")
                        .font(.subheadline)
                    Text("\(bookings)")
                        .font(.title2)
                        .fontWeight(.bold)
                }
            }
        }
        .padding()
        .background(Color.theme.cardBackground)
        .cornerRadius(12)
    }
} 