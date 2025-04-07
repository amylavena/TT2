import SwiftUI

enum SortOption {
    case priceHighToLow
    case priceLowToHigh
    case newest
    case closest
}

struct MarketplaceView: View {
    @State private var searchText = ""
    @State private var selectedTab = "For you"
    @State private var showingCategories = false
    @State private var sortOption: SortOption = .priceHighToLow
    
    let tabs = ["Sell", "For you", "Local"]
    let sampleTools = MarketplaceTool.sampleTools
    
    var filteredTools: [MarketplaceTool] {
        if searchText.isEmpty {
            return sampleTools
        }
        return sampleTools.filter { tool in
            tool.name.localizedCaseInsensitiveContains(searchText) ||
            tool.description.localizedCaseInsensitiveContains(searchText) ||
            tool.category.rawValue.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    private var sortedTools: [MarketplaceTool] {
        switch sortOption {
        case .priceHighToLow:
            return filteredTools.sorted { $0.price > $1.price }
        case .priceLowToHigh:
            return filteredTools.sorted { $0.price < $1.price }
        case .newest:
            return filteredTools // For now, return unsorted as we don't have date field
        case .closest:
            return filteredTools // For now, return unsorted as we don't have distance calculation
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Top Navigation Bar
            HStack {
                Text("Marketplace")
                    .font(.largeTitle)
                    .bold()
                Spacer()
                Button(action: { /* Search action */ }) {
                    Image(systemName: "magnifyingglass")
                        .font(.title)
                        .foregroundColor(Color.theme.primary)
                }
            }
            .padding(.horizontal)
            .padding(.top, 8)
            
            // Tab Bar
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(tabs, id: \.self) { tab in
                        Button(action: { selectedTab = tab }) {
                            Text(tab)
                                .foregroundColor(selectedTab == tab ? .white : Color.theme.textSecondary)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(selectedTab == tab ? Color.theme.primary : Color.clear)
                                .cornerRadius(20)
                        }
                    }
                    
                    Menu {
                        Button("Top Categories", action: {})
                        Button("Power Tools", action: {})
                        Button("Hand Tools", action: {})
                        Button("Gardening", action: {})
                        Button("All Categories", action: {})
                    } label: {
                        HStack {
                            Text("More")
                            Image(systemName: "chevron.down")
                        }
                        .foregroundColor(Color.theme.textSecondary)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.vertical, 8)
            
            Divider()
            
            // Main Content
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("Today's picks")
                            .font(.title2)
                            .bold()
                        Spacer()
                        Button(action: {}) {
                            HStack {
                                Image(systemName: "location.fill")
                                    .foregroundColor(Color.theme.primary)
                                Text("Buda, Texas")
                                    .foregroundColor(Color.theme.primary)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    LazyVGrid(
                        columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ],
                        spacing: 16
                    ) {
                        ForEach(sortedTools) { tool in
                            NavigationLink(destination: ToolDetailView(tool: tool)) {
                                ToolCard(tool: tool)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .background(Color.theme.background)
    }
}

// Update ToolCard to use theme colors
struct ToolCard: View {
    let tool: MarketplaceTool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Tool Image
            if let image = UIImage(named: tool.imageURL) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 120)
                    .clipped()
                    .cornerRadius(8)
            } else {
                // Fallback to icon if no image is found
                Image(systemName: toolIcon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(40)
                    .frame(height: 120)
                    .background(Color.theme.cardBackground)
                    .cornerRadius(8)
            }
            
            // Tool Info
            VStack(alignment: .leading, spacing: 4) {
                Text(tool.name)
                    .font(.headline)
                    .lineLimit(1)
                    .foregroundColor(Color.theme.textPrimary)
                
                Text(String(format: "$%.2f", tool.price))
                    .font(.subheadline)
                    .foregroundColor(Color.theme.primary)
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(Color(red: 0.75, green: 0.70, blue: 0.65))
                    Text("4.5")
                        .font(.caption)
                        .foregroundColor(Color.theme.textPrimary)
                    Text("(24)")
                        .font(.caption)
                        .foregroundColor(Color.theme.textSecondary)
                }
            }
        }
        .padding()
        .background(Color.theme.cardBackground)
        .cornerRadius(12)
        .shadow(
            color: Color.theme.shadowColor,
            radius: Color.theme.shadowRadius,
            x: 0,
            y: Color.theme.shadowY
        )
    }
    
    private var toolIcon: String {
        switch tool.category {
        case .powerTools:
            return "wrench.and.screwdriver.fill"
        case .handTools:
            return "hammer.fill"
        case .electrical:
            return "bolt.fill"
        case .plumbing:
            return "drop.fill"
        case .gardening:
            return "leaf.fill"
        default:
            return "wrench.and.screwdriver.fill"
        }
    }
}

struct MarketplaceView_Previews: PreviewProvider {
    static var previews: some View {
        MarketplaceView()
    }
} 