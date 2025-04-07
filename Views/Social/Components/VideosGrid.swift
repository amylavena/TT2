import SwiftUI

struct VideosGrid: View {
    let videos: [ProjectVideo]
    
    var body: some View {
        LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ], spacing: 2) {
            ForEach(videos) { video in
                NavigationLink(destination: ProjectVideoView(video: video)) {
                    VideoThumbnail(video: video)
                }
            }
        }
    }
}

struct VideoThumbnail: View {
    let video: ProjectVideo
    
    var body: some View {
        AsyncImage(url: URL(string: video.thumbnailURL)) { image in
            image.resizable()
        } placeholder: {
            Color.gray
        }
        .aspectRatio(1, contentMode: .fill)
        .overlay(
            VStack {
                Spacer()
                HStack {
                    Image(systemName: "play.fill")
                    Text("\(video.views)")
                }
                .font(.caption)
                .foregroundColor(.white)
                .padding(4)
                .background(Color.black.opacity(0.5))
            }
        )
    }
} 