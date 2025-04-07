import Foundation

class VideoAnalyticsViewModel: ObservableObject {
    @Published var analytics: VideoAnalytics?
    @Published var isLoading = false
    
    init() {
        loadAnalytics()
    }
    
    func loadAnalytics() {
        isLoading = true
        // TODO: Implement actual analytics loading
    }
} 