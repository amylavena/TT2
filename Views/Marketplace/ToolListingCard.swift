import SwiftUI

struct ToolListingCard: View {
    let tool: MarketplaceTool
    
    var body: some View {
        NavigationLink {
            ToolDetailView(tool: tool)
        } label: {
            VStack(alignment: .leading, spacing: 8) {
                // Tool Image
                Image(systemName: toolIcon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(40)
                    .background(Color.gray.opacity(0.1))
                    .frame(height: 140)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(tool.name)
                        .font(.headline)
                        .foregroundColor(Color.theme.textPrimary)
                    
                    Text(String(format: "$%.2f", tool.price))
                        .font(.subheadline)
                        .foregroundColor(Color.theme.primary)
                    
                    HStack {
                        Image(systemName: "location.fill")
                            .font(.caption)
                        Text(tool.location)
                            .font(.caption)
                    }
                    .foregroundColor(Color.theme.textSecondary)
                    
                    Text(tool.isAvailable ? "For Sale" : "Sold")
                        .font(.caption)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(tool.isAvailable ? Color.theme.primary.opacity(0.2) : Color.red.opacity(0.2))
                        .foregroundColor(tool.isAvailable ? Color.theme.primary : .red)
                        .cornerRadius(4)
                }
                .padding(.horizontal, 8)
                .padding(.bottom, 8)
            }
            .background(Color.theme.cardBackground)
            .cornerRadius(12)
            .shadow(
                color: Color.theme.shadowColor,
                radius: Color.theme.shadowRadius,
                x: 0,
                y: Color.theme.shadowY
            )
        }
    }
    
    private var toolIcon: String {
        switch tool.imageURL {
        case "drill_1":
            return "drill.fill"
        case "saw_1":
            return "scissors"
        case "tiller_1":
            return "leaf.fill"
        case "clamps_1":
            return "square.and.pencil"
        case "compressor_1":
            return "gauge.medium"
        case "router_1":
            return "tablecells.fill"
        default:
            return "wrench.and.screwdriver.fill"
        }
    }
}