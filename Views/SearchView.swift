import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var selectedCategory: ProjectCategory?
    @State private var filteredCoaches: [Coach] = []
    
    private let allCoaches: [Coach] = []
    
    // Sample projects for demonstration
    private let sampleProjects = [
        DIYProject(
            title: "Modern Coffee Table",
            description: "Build a sleek coffee table perfect for any living room",
            category: .woodworking,
            difficulty: .intermediate,
            estimatedTime: 3600 * 6,
            materials: ["Oak Wood", "Wood Stain", "Screws"],
            tools: ["Circular Saw", "Power Drill", "Sandpaper"],
            thumbnailURL: "coffee_table"
        ),
        DIYProject(
            title: "Herb Garden Planter",
            description: "Create a beautiful herb garden for your kitchen",
            category: .gardening,
            difficulty: .beginner,
            estimatedTime: 3600 * 2,
            materials: ["Cedar Wood", "Soil", "Herb Seeds"],
            tools: ["Hand Saw", "Drill", "Garden Tools"],
            thumbnailURL: "herb_garden"
        )
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                SearchBar(
                    text: $searchText,
                    placeholder: "Search projects...",
                    filteredCoaches: $filteredCoaches,
                    allCoaches: allCoaches
                )
                .padding(.horizontal)
                
                ProjectCategoryList(
                    categories: ProjectCategory.allCases,
                    selectedCategory: selectedCategory,
                    onSelect: { category in
                        selectedCategory = category
                    }
                )
                
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(sampleProjects, id: \.id) { project in
                            ProjectCard(project: project)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Search")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
