import AVKit

class CustomVideoPlayerViewModel: ObservableObject {
    @Published var isPlaying = false
    @Published var progress: Double = 0
    @Published var duration: TimeInterval = 0
    @Published var playbackSpeed: Double = 1.0
    
    func togglePlayback() {
        isPlaying.toggle()
    }
    
    func seek(_ to: Double) {
        progress = to
    }
    
    func setPlaybackSpeed(_ speed: Double) {
        playbackSpeed = speed
    }
    
    func setQuality(_ quality: String) {
        // TODO: Implement quality switching
    }
} 