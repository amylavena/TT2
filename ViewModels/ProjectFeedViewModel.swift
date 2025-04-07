import Foundation
import Combine

class ProjectFeedViewModel: ObservableObject {
    @Published var videos: [ProjectVideo] = []
    @Published var isLoading = false
    @Published var error: Error?
    
    private var currentPage = 0
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        // Load sample videos
        videos = ProjectVideo.sampleVideos
    }
    
    func loadVideos() {
        isLoading = true
        
        // Simulate network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.videos = ProjectVideo.sampleVideos
            self.isLoading = false
        }
    }
    
    func loadMoreVideos() {
        currentPage += 1
        loadVideos()
    }
} 