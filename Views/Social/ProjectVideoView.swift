import SwiftUI
import AVKit

struct ProjectVideoView: View {
    let video: ProjectVideo
    @StateObject private var viewModel = ProjectVideoViewModel()
    @State private var showComments = false
    @State private var showShareSheet = false
    
    var body: some View {
        ZStack {
            // Video Player
            VideoPlayer(player: viewModel.player)
                .ignoresSafeArea()
                .overlay(
                    // Gradient overlay for better text visibility
                    LinearGradient(
                        gradient: Gradient(colors: [.clear, .black.opacity(0.3)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            
            // Content Overlay
            VStack {
                Spacer()
                
                HStack(alignment: .bottom, spacing: 16) {
                    // Left side: Video Info
                    VStack(alignment: .leading, spacing: 8) {
                        // Creator info
                        if let coach = video.coach {
                            HStack(spacing: 8) {
                                AsyncImage(url: URL(string: coach.imageURL)) { image in
                                    image.resizable()
                                } placeholder: {
                                    Color.gray
                                }
                                .frame(width: 44, height: 44)
                                .clipShape(Circle())
                                
                                Text("@\(coach.name)")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
                                Button(action: {}) {
                                    Text("Follow")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 4)
                                        .background(Color.theme.primary)
                                        .cornerRadius(16)
                                }
                            }
                        }
                        
                        // Video description
                        Text(video.description)
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .lineLimit(2)
                        
                        // Tags
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(video.tags, id: \.self) { tag in
                                    Text("#\(tag)")
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                    .padding(.leading)
                    .padding(.bottom, 20)
                    
                    Spacer()
                    
                    // Right side: Interaction Buttons
                    VStack(spacing: 24) {
                        // Profile Button
                        Button(action: { viewModel.showCoachProfile = true }) {
                            if let coach = video.coach {
                                AsyncImage(url: URL(string: coach.imageURL)) { image in
                                    image.resizable()
                                } placeholder: {
                                    Color.gray
                                }
                                .frame(width: 48, height: 48)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 2)
                                )
                            }
                        }
                        
                        // Like Button
                        TikTokButton(
                            icon: "heart.fill",
                            count: video.likes,
                            isActive: viewModel.isLiked
                        ) {
                            viewModel.toggleLike()
                        }
                        
                        // Comments Button
                        TikTokButton(
                            icon: "bubble.left.fill",
                            count: video.commentCount,
                            isActive: false
                        ) {
                            showComments = true
                        }
                        
                        // Share Button
                        TikTokButton(
                            icon: "arrowshape.turn.up.right.fill",
                            count: nil,
                            isActive: false
                        ) {
                            showShareSheet = true
                        }
                        
                        // Bookmark Button
                        TikTokButton(
                            icon: "bookmark.fill",
                            count: nil,
                            isActive: viewModel.isSaved
                        ) {
                            viewModel.toggleSave()
                        }
                    }
                    .padding(.trailing, 16)
                    .padding(.bottom, 20)
                }
            }
        }
        .sheet(isPresented: $viewModel.showCoachProfile) {
            if let coach = video.coach {
                CoachProfileView(coach: coach)
            }
        }
        .sheet(isPresented: $showComments) {
            VideoCommentView(video: video)
        }
        .sheet(isPresented: $showShareSheet) {
            VideoShareSheet(video: video)
        }
        .onAppear {
            if let url = URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4") {
                viewModel.setupPlayer(with: url)
            }
        }
        .onDisappear {
            viewModel.player?.pause()
        }
    }
}

// New TikTok-style button component
struct TikTokButton: View {
    let icon: String
    let count: Int?
    let isActive: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 30))
                    .foregroundColor(isActive ? Color.theme.primary : .white)
                
                if let count = count {
                    Text(formatCount(count))
                        .font(.caption)
                        .bold()
                        .foregroundColor(.white)
                }
            }
        }
    }
    
    private func formatCount(_ count: Int) -> String {
        if count >= 1_000_000 {
            return String(format: "%.1fM", Double(count) / 1_000_000)
        } else if count >= 1_000 {
            return String(format: "%.1fK", Double(count) / 1_000)
        }
        return "\(count)"
    }
} 
