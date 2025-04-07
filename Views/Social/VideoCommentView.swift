import SwiftUI

struct VideoCommentView: View {
    let video: ProjectVideo
    @StateObject private var viewModel = VideoCommentViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                // Comments List
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.comments) { comment in
                            CommentCell(comment: comment) { replyTo in
                                viewModel.replyingTo = replyTo
                            }
                        }
                    }
                    .padding()
                }
                
                // Comment Input
                CommentInputBar(
                    text: $viewModel.newComment,
                    replyingTo: viewModel.replyingTo,
                    onSend: {
                        viewModel.postComment()
                    },
                    onCancelReply: {
                        viewModel.replyingTo = nil
                    }
                )
            }
            .navigationTitle("Comments")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Close") { dismiss() }
                }
            }
        }
    }
}

struct CommentCell: View {
    let comment: VideoComment
    let onReply: (VideoComment) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Author Info
            HStack {
                AsyncImage(url: URL(string: comment.authorPhotoURL)) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 32, height: 32)
                .clipShape(Circle())
                
                Text(comment.authorName)
                    .font(.subheadline)
                    .fontWeight(.medium)
                
                Spacer()
                
                Text(comment.timeAgo)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            // Comment Content
            Text(comment.content)
                .font(.body)
            
            // Actions
            HStack(spacing: 16) {
                Button(action: { }) {
                    Label("\(comment.likes)", systemImage: "heart")
                }
                
                Button(action: { onReply(comment) }) {
                    Label("Reply", systemImage: "arrowshape.turn.up.left")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            // Replies
            if !comment.replies.isEmpty {
                ForEach(comment.replies) { reply in
                    CommentCell(comment: reply, onReply: onReply)
                        .padding(.leading, 32)
                }
            }
        }
    }
}

struct CommentInputBar: View {
    @Binding var text: String
    let replyingTo: VideoComment?
    let onSend: () -> Void
    let onCancelReply: () -> Void
    
    var body: some View {
        VStack(spacing: 8) {
            if let reply = replyingTo {
                HStack {
                    Text("Replying to \(reply.authorName)")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Button(action: onCancelReply) {
                        Image(systemName: "xmark.circle.fill")
                    }
                }
                .padding(.horizontal)
            }
            
            HStack {
                TextField("Add a comment...", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: onSend) {
                    Text("Post")
                        .fontWeight(.medium)
                }
                .disabled(text.isEmpty)
            }
            .padding()
        }
        .background(Color.theme.cardBackground)
    }
} 