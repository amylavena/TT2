import Foundation

class ActivityFeedViewModel: ObservableObject {
    @Published var activities: [ActivityItem] = []
    @Published var isLoading = false
    
    func loadActivities() async {
        isLoading = true
        // TODO: Implement actual activity loading
        // For now, using sample data
        activities = []
        isLoading = false
    }
} 