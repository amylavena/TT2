import Foundation

class UserProfileViewModel: ObservableObject {
    @Published var user: User?
    @Published var videos: [ProjectVideo] = []
    @Published var likedVideos: [ProjectVideo] = []
    @Published var savedVideos: [ProjectVideo] = []
    @Published var isLoading = false
    
    init() {
        loadUserProfile()
        loadVideos()
    }
    
    func loadUserProfile() {
        // TODO: Load from backend
        user = User(
            id: "current_user",
            name: "John Smith",
            email: "john@example.com",
            profilePhotoURL: nil,
            bio: "DIY enthusiast and woodworking hobbyist"
        )
    }
    
    func loadVideos() {
        isLoading = true
        // TODO: Load from backend
        videos = ProjectVideo.sampleVideos
        likedVideos = []
        savedVideos = []
        isLoading = false
    }
    
    func deleteVideo(_ video: ProjectVideo) {
        // TODO: Implement delete functionality
        videos.removeAll { $0.id == video.id }
    }
    
    func toggleFollow() {
        // TODO: Implement follow/unfollow
    }
} 