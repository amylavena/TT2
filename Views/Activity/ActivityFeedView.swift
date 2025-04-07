import SwiftUI

struct ActivityFeedView: View {
    @StateObject private var viewModel = ActivityFeedViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.activities) { activity in
                    ActivityCell(activity: activity)
                }
            }
            .navigationTitle("Activity")
            .refreshable {
                await viewModel.loadActivities()
            }
        }
    }
}

struct ActivityCell: View {
    let activity: ActivityItem
    
    var body: some View {
        HStack(spacing: 12) {
            // User Photo
            AsyncImage(url: URL(string: activity.userPhotoURL)) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .frame(width: 40, height: 40)
            .clipShape(Circle())
            
            // Activity Info
            VStack(alignment: .leading, spacing: 4) {
                Text(activity.message)
                    .font(.subheadline)
                
                Text(activity.timeAgo)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            // Video Thumbnail if applicable
            if let thumbnail = activity.videoThumbnail {
                AsyncImage(url: URL(string: thumbnail)) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 60, height: 60)
                .cornerRadius(8)
            }
        }
        .padding(.vertical, 4)
    }
} 