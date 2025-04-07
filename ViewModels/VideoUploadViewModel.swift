import SwiftUI
import AVKit

class VideoUploadViewModel: ObservableObject {
    @Published var videoURL: URL?
    @Published var player: AVPlayer?
    @Published var title = ""
    @Published var description = ""
    @Published var category: ProjectCategory = .woodworking
    @Published var currentTag = ""
    @Published var tags: Set<String> = []
    @Published var offersCoaching = false
    @Published var hourlyRate: Double = 0
    @Published var showVideoPicker = false
    @Published var showError = false
    @Published var errorMessage = ""
    
    @Published var uploadProgress: Double = 0
    @Published var isUploading = false
    @Published var isProcessing = false
    @Published var processingProgress: Double = 0
    
    enum UploadState {
        case ready
        case uploading
        case processing
        case complete
        case error(String)
    }
    
    @Published var uploadState: UploadState = .ready
    
    var isCoach: Bool {
        // TODO: Implement actual coach check
        return true
    }
    
    var canPost: Bool {
        guard let _ = videoURL else { return false }
        return !title.isEmpty && !description.isEmpty
    }
    
    func addTag() {
        let tag = currentTag.trimmingCharacters(in: .whitespacesAndNewlines)
        if !tag.isEmpty {
            tags.insert(tag)
            currentTag = ""
        }
    }
    
    func removeTag(_ tag: String) {
        tags.remove(tag)
    }
    
    func uploadVideo() {
        guard let videoURL = videoURL else { return }
        
        isUploading = true
        uploadState = .uploading
        
        // Simulate upload progress
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if self.uploadProgress < 1.0 {
                self.uploadProgress += 0.01
            } else {
                timer.invalidate()
                self.startProcessing()
            }
        }
    }
    
    private func startProcessing() {
        isUploading = false
        isProcessing = true
        uploadState = .processing
        
        // Simulate processing progress
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
            if self.processingProgress < 1.0 {
                self.processingProgress += 0.05
            } else {
                timer.invalidate()
                self.completeUpload()
            }
        }
    }
    
    private func completeUpload() {
        isProcessing = false
        uploadState = .complete
        // TODO: Handle successful upload
    }
} 