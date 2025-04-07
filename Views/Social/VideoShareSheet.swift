import SwiftUI

struct VideoShareSheet: View {
    let video: ProjectVideo
    @Environment(\.dismiss) private var dismiss
    @State private var showingActivitySheet = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ShareButton(title: "Copy Link", icon: "link") {
                        // TODO: Copy video link to clipboard
                    }
                    
                    ShareButton(title: "Share to Messages", icon: "message.fill") {
                        // TODO: Share to Messages
                    }
                    
                    ShareButton(title: "Share to WhatsApp", icon: "bubble.left.fill") {
                        // TODO: Share to WhatsApp
                    }
                    
                    Button(action: { showingActivitySheet = true }) {
                        Label("More Options", systemImage: "square.and.arrow.up")
                    }
                }
                
                Section("Video Info") {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(video.title)
                            .font(.headline)
                        Text(video.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Share")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
        .sheet(isPresented: $showingActivitySheet) {
            ShareSheet(items: [video.title, URL(string: "https://example.com")!])
        }
    }
}

struct ShareButton: View {
    let title: String
    let icon: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Label(title, systemImage: icon)
        }
    }
}

struct ShareSheet: UIViewControllerRepresentable {
    let items: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: items, applicationActivities: nil)
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
} 