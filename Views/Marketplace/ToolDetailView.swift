import SwiftUI

struct ToolDetailView: View {
    let tool: MarketplaceTool
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Tool Image
                if let image = UIImage(named: tool.imageURL) {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 300)
                        .clipped()
                } else {
                    // Fallback to icon if no image is found
                    Image(systemName: toolIcon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(60)
                        .frame(maxHeight: 300)
                        .background(Color.theme.cardBackground)
                }
                
                VStack(spacing: 24) {
                    // Tool Info
                    VStack(alignment: .leading, spacing: 12) {
                        Text(tool.name)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text(String(format: "$%.2f", tool.price))
                            .font(.title2)
                            .foregroundColor(Color.theme.primary)
                        
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color(red: 0.75, green: 0.70, blue: 0.65))
                            Text("4.5")
                            Text("(24 reviews)")
                                .foregroundColor(Color.theme.textSecondary)
                        }
                        .font(.subheadline)
                    }
                    
                    Divider()
                    
                    // Description
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Description")
                            .font(.headline)
                        
                        Text(tool.description)
                            .font(.body)
                            .foregroundColor(Color.theme.textSecondary)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    Divider()
                    
                    // Specifications
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Specifications")
                            .font(.headline)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            specificationRow(title: "Brand", value: tool.brand)
                            specificationRow(title: "Condition", value: "Excellent")
                            specificationRow(title: "Location", value: tool.location)
                        }
                    }
                    
                    // Buy Button
                    Button(action: {}) {
                        Text(tool.isAvailable ? "Buy Now" : "Sold")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(tool.isAvailable ? Color.theme.primary : Color.gray)
                            .cornerRadius(12)
                    }
                    .disabled(!tool.isAvailable)
                    .padding(.top, 8)
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 24)
        }
        .navigationTitle("Tool Details")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func specificationRow(title: String, value: String) -> some View {
        HStack {
            Text(title)
                .foregroundColor(Color.theme.textSecondary)
            Spacer()
            Text(value)
        }
        .font(.subheadline)
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

struct ToolDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ToolDetailView(tool: MarketplaceTool.sampleTool)
        }
    }
} 