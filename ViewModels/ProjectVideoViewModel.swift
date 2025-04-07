import Foundation
import AVKit

class ProjectVideoViewModel: ObservableObject {
    @Published var player: AVPlayer?
    @Published var isLiked = false
    @Published var isSaved = false
    @Published var showCoachProfile = false
    @Published var showBooking = false
    
    func toggleLike() {
        isLiked.toggle()
        // TODO: Implement like functionality
    }
    
    func toggleSave() {
        isSaved.toggle()
        // TODO: Implement save functionality
    }
    
    func setupPlayer(with url: URL) {
        player = AVPlayer(url: url)
        player?.play()
    }
} 