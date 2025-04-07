import SwiftUI

struct CoachSearchView: View {
    @State private var searchText = ""
    @State private var selectedCategory: ProjectCategory?
    @State private var filteredCoaches: [Coach] = []
    private let sageGreen = Color(red: 0.47, green: 0.53, blue: 0.45)
    
    // Use the sample data from extension
    private let sampleCoaches = Coach.sampleCoaches
    
    var body: some View {
        VStack(spacing: 0) {
            // Title and subtitle
            VStack(alignment: .leading, spacing: 8) {
                Text("Tap into Expertise")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black.opacity(0.8))
                
                Text("Connect with experts who love to teach")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.top)
            
            // Search bar
            SearchBar(
                text: $searchText,
                placeholder: "Search by skill or project type",
                filteredCoaches: $filteredCoaches,
                allCoaches: sampleCoaches
            )
            .padding()
            
            // Categories filter
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(ProjectCategory.allCases) { category in
                        CategoryPill(
                            category: category,
                            isSelected: selectedCategory == category,
                            action: {
                                if selectedCategory == category {
                                    selectedCategory = nil
                                    filteredCoaches = sampleCoaches
                                } else {
                                    selectedCategory = category
                                    filteredCoaches = sampleCoaches.filter { $0.category == category }
                                }
                            }
                        )
                    }
                }
                .padding(.horizontal)
            }
            
            // Coach list
            if filteredCoaches.isEmpty {
                VStack(spacing: 16) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 48))
                        .foregroundColor(.gray)
                    Text("No coaches found")
                        .font(.headline)
                    Text("Try adjusting your search or filters")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(filteredCoaches) { coach in
                            NavigationLink(destination: CoachDetailView(coach: coach)) {
                                CoachCard(coach: coach)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            filteredCoaches = sampleCoaches
        }
    }
} 
