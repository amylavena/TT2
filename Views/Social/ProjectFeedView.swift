import SwiftUI

struct ProjectFeedView: View {
    @StateObject private var viewModel = ProjectFeedViewModel()
    @State private var currentIndex = 0
    @State private var selectedTab = 0 // For Following/For You
    @State private var showUpload = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                // Video Feed
                GeometryReader { geometry in
                    TabView(selection: $currentIndex) {
                        ForEach(viewModel.videos.indices, id: \.self) { index in
                            ProjectVideoView(video: viewModel.videos[index])
                                .frame(
                                    width: geometry.size.width,
                                    height: geometry.size.height
                                )
                                .rotationEffect(.degrees(0)) // Remove rotation
                                .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .ignoresSafeArea()
                }
                
                // TikTok-style Header
                VStack(spacing: 0) {
                    HStack(spacing: 20) {
                        Button(action: { selectedTab = 0 }) {
                            Text("Following")
                                .foregroundColor(selectedTab == 0 ? .white : .white.opacity(0.7))
                                .fontWeight(selectedTab == 0 ? .bold : .regular)
                        }
                        
                        Button(action: { selectedTab = 1 }) {
                            Text("For You")
                                .foregroundColor(selectedTab == 1 ? .white : .white.opacity(0.7))
                                .fontWeight(selectedTab == 1 ? .bold : .regular)
                        }
                    }
                    .padding(.top, 60)
                    .padding(.bottom, 20)
                    
                    if selectedTab == 0 {
                        // Compact category filter for Following tab
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(ProjectCategory.allCases) { category in
                                    Text(category.rawValue)
                                        .font(.caption)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(Color.white.opacity(0.2))
                                        .clipShape(Capsule())
                                }
                            }
                            .padding(.horizontal)
                        }
                        .frame(height: 40)
                    }
                }
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.black.opacity(0.6), Color.clear]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                
                // Upload Button
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: { showUpload = true }) {
                            Image(systemName: "plus")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.white)
                                .frame(width: 60, height: 60)
                                .background(Color.theme.primary)
                                .clipShape(Circle())
                                .shadow(radius: 10)
                        }
                        .padding(.trailing, 20)
                        .padding(.bottom, 80)
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .sheet(isPresented: $showUpload) {
            VideoUploadView()
        }
    }
} 