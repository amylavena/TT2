import SwiftUI
import PhotosUI
import AVKit

struct VideoUploadView: View {
    @StateObject private var viewModel = VideoUploadViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                // Video Preview
                if let player = viewModel.player {
                    VideoPlayer(player: player)
                        .frame(height: 200)
                } else {
                    Button(action: { viewModel.showVideoPicker = true }) {
                        VStack {
                            Image(systemName: "video.badge.plus")
                                .font(.largeTitle)
                            Text("Select Video")
                        }
                        .frame(height: 200)
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.1))
                    }
                }
                
                // Video Details
                Section {
                    TextField("Title", text: $viewModel.title)
                    TextEditor(text: $viewModel.description)
                        .frame(height: 100)
                    
                    VStack(alignment: .leading) {
                        Text("Category")
                        Picker("Category", selection: $viewModel.category as Binding<ProjectCategory>) {
                            ForEach(ProjectCategory.allCases) { category in
                                Text(category.rawValue)
                                    .tag(category)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                } header: {
                    Text("Details")
                }
                
                // Tags
                Section {
                    TextField("Add tag", text: $viewModel.currentTag)
                        .onSubmit {
                            viewModel.addTag()
                        }
                    
                    FlowLayout(
                        spacing: 8,
                        data: Array(viewModel.tags)
                    ) { tag in
                        TagView(tag: tag) {
                            viewModel.removeTag(tag)
                        }
                    }
                } header: {
                    Text("Tags")
                }
                
                // Coaching Options
                if viewModel.isCoach {
                    Section {
                        Toggle("Offer Coaching", isOn: $viewModel.offersCoaching)
                        
                        if viewModel.offersCoaching {
                            TextField("Hourly Rate", value: $viewModel.hourlyRate, format: .currency(code: "USD"))
                                .keyboardType(.decimalPad)
                        }
                    } header: {
                        Text("Coaching")
                    }
                }
            }
            .navigationTitle("New Video")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Post") {
                        viewModel.uploadVideo()
                    }
                    .disabled(!viewModel.canPost)
                }
            }
        }
        .sheet(isPresented: $viewModel.showVideoPicker) {
            VideoPicker(videoURL: $viewModel.videoURL)
        }
        .alert("Error", isPresented: $viewModel.showError) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(viewModel.errorMessage)
        }
    }
}

struct TagView: View {
    let tag: String
    let onRemove: () -> Void
    
    var body: some View {
        HStack {
            Text(tag)
            Button(action: onRemove) {
                Image(systemName: "xmark.circle.fill")
            }
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(Color.theme.primary.opacity(0.1))
        .cornerRadius(12)
    }
} 