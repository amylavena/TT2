import SwiftUI

struct ProjectListView: View {
    let category: ProjectCategory
    @State private var selectedDifficulty: DIYProject.ProjectDifficulty?
    @State private var showFilters = false
    
    // TODO: Replace with actual data from backend
    private var projects: [DIYProject] = [
        DIYProject(
            title: "Modern Coffee Table",
            description: "Build a sleek, modern coffee table perfect for any living room",
            category: ProjectCategory.woodworking,
            difficulty: .intermediate,
            estimatedTime: 3600 * 6, // 6 hours
            materials: ["Wood", "Screws", "Wood Finish"],
            tools: ["Saw", "Drill", "Sandpaper"],
            thumbnailURL: "coffee_table"
        ),
        DIYProject(
            title: "Herb Garden Planter",
            description: "Create a beautiful herb garden planter for your kitchen",
            category: ProjectCategory.gardening,
            difficulty: .beginner,
            estimatedTime: 3600 * 2, // 2 hours
            materials: ["Wood", "Soil", "Seeds"],
            tools: ["Saw", "Drill", "Garden Tools"],
            thumbnailURL: "herb_garden"
        )
    ]
    
    var filteredProjects: [DIYProject] {
        projects.filter { project in
            project.category == category &&
            (selectedDifficulty == nil || project.difficulty == selectedDifficulty)
        }
    }
    
    // Make initializer public
    public init(category: ProjectCategory) {
        self.category = category
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Filter Header
            VStack(spacing: 12) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        FilterPill(
                            icon: "line.3.horizontal.decrease.circle",
                            title: "Filters",
                            isActive: selectedDifficulty != nil,
                            action: { showFilters = true }
                        )
                        
                        if let difficulty = selectedDifficulty {
                            FilterPill(
                                title: difficulty.rawValue,
                                isActive: true,
                                action: { selectedDifficulty = nil }
                            )
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.vertical, 8)
            .background(Color.theme.cardBackground)
            
            if filteredProjects.isEmpty {
                VStack(spacing: 16) {
                    Image(systemName: "hammer.fill")
                        .font(.system(size: 48))
                        .foregroundColor(.gray)
                    
                    Text("No projects found")
                        .font(.headline)
                    
                    Text("Try adjusting your filters")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(filteredProjects) { project in
                            NavigationLink(destination: ProjectDetailView(project: project)) {
                                ProjectCard(project: project)
                                    .padding(.horizontal)
                            }
                        }
                    }
                    .padding(.vertical)
                }
            }
        }
        .navigationTitle(category.rawValue)
        .sheet(isPresented: $showFilters) {
            ProjectFilterView(selectedDifficulty: $selectedDifficulty)
        }
    }
    
    // Add this helper function to convert between difficulty types
    private func convertDifficulty(_ difficulty: DIYProject.ProjectDifficulty) -> DIYProject.ProjectDifficulty {
        switch difficulty {
        case .beginner:
            return .beginner
        case .intermediate:
            return .intermediate
        case .advanced:
            return .advanced
        }
    }
}

struct ProjectFilterView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var selectedDifficulty: DIYProject.ProjectDifficulty?
    
    var body: some View {
        NavigationView {
            Form {
                Section("Difficulty") {
                    ForEach(DIYProject.ProjectDifficulty.allCases, id: \.self) { difficulty in
                        Button(action: {
                            if selectedDifficulty == difficulty {
                                selectedDifficulty = nil
                            } else {
                                selectedDifficulty = difficulty
                            }
                        }) {
                            HStack {
                                Text(difficulty.rawValue)
                                    .foregroundColor(.primary)
                                Spacer()
                                if selectedDifficulty == difficulty {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(Color.theme.primary)
                                }
                            }
                        }
                    }
                }
                
                Section {
                    Button("Reset Filters", role: .destructive) {
                        selectedDifficulty = nil
                    }
                }
            }
            .navigationTitle("Filters")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Apply") {
                        dismiss()
                    }
                    .fontWeight(.medium)
                }
            }
        }
    }
}

struct ProjectListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProjectListView(category: .woodworking)
        }
    }
} 
