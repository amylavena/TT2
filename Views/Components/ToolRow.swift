import SwiftUI

struct ToolRow: View {
    let tool: Tool
    let style: ToolRowStyle
    
    init(tool: Tool, style: ToolRowStyle = .compact) {
        self.tool = tool
        self.style = style
    }
    
    var body: some View {
        switch style {
        case .detailed:
            detailedView
        case .compact:
            compactView
        }
    }
    
    private var detailedView: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(tool.name)
                .font(.headline)
            
            Text(tool.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text(tool.category.rawValue)
                .font(.caption)
                .padding(.horizontal, 8)
                .padding(.vertical, 2)
                .background(Color.blue.opacity(0.1))
                .foregroundColor(.blue)
                .cornerRadius(4)
        }
        .padding(.vertical, 4)
    }
    
    private var compactView: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(tool.name)
                    .font(.subheadline)
                if tool.category == .powerTools {
                    Text("Power Tool")
                        .font(.caption)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color.red.opacity(0.1))
                        .foregroundColor(.red)
                        .cornerRadius(4)
                }
            }
            
            Text(tool.description)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 8)
    }
}

enum ToolRowStyle {
    case detailed  // For editing/creation views
    case compact   // For list/overview views
} 