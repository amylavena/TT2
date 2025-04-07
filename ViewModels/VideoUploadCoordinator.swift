import SwiftUI
import AVKit

class VideoUploadCoordinator: ObservableObject {
    @Published var currentStep = 0
    @Published var videoURL: URL?
    @Published var thumbnailImage: UIImage?
    @Published var title = ""
    @Published var description = ""
    @Published var category: ProjectCategory = .woodworking
    @Published var tags: Set<String> = []
    @Published var uploadProgress: Double = 0
    @Published var isUploading = false
    @Published var showError = false
    @Published var errorMessage = ""
    @Published var currentTag = ""
    
    var canProceedToNextStep: Bool {
        switch currentStep {
        case 0: return videoURL != nil
        case 1: return !title.isEmpty && !description.isEmpty
        case 2: return true // Tags are optional
        default: return false
        }
    }
    
    func generateThumbnail(from url: URL) {
        let asset = AVAsset(url: url)
        let generator = AVAssetImageGenerator(asset: asset)
        generator.appliesPreferredTrackTransform = true
        
        let time = CMTime(seconds: 0, preferredTimescale: 1)
        
        Task {
            do {
                let cgImage = try await generator.image(at: time).image
                await MainActor.run {
                    thumbnailImage = UIImage(cgImage: cgImage)
                }
            } catch {
                print("Error generating thumbnail: \(error)")
            }
        }
    }
    
    func uploadVideo() async -> Bool {
        guard let videoURL = videoURL else { return false }
        
        isUploading = true
        
        // Simulate upload progress
        for i in 1...100 {
            try? await Task.sleep(nanoseconds: 50_000_000)
            await MainActor.run {
                uploadProgress = Double(i) / 100.0
            }
        }
        
        isUploading = false
        return true
    }
} 