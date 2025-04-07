import Foundation

class VideoCommentViewModel: ObservableObject {
    @Published var comments: [VideoComment] = []
    @Published var newComment = ""
    @Published var replyingTo: VideoComment?
    @Published var isLoading = false
    
    func loadComments() {
        isLoading = true
        // TODO: Load comments from backend
    }
    
    func postComment() {
        guard !newComment.isEmpty else { return }
        
        // TODO: Implement actual comment posting
        let comment = VideoComment(
            id: UUID(),
            authorId: "current_user",
            authorName: "Current User",
            authorPhotoURL: "user_photo",
            content: newComment,
            timestamp: Date(),
            likes: 0,
            replies: []
        )
        
        if let replyTo = replyingTo {
            // Add reply to existing comment
            if let index = comments.firstIndex(where: { $0.id == replyTo.id }) {
                comments[index].replies.append(comment)
            }
        } else {
            // Add new top-level comment
            comments.insert(comment, at: 0)
        }
        
        newComment = ""
        replyingTo = nil
    }
} 