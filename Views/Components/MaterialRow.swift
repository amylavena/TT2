import SwiftUI

struct MaterialRow: View {
    let material: ProjectMaterial
    let style: MaterialRowStyle
    
    init(material: ProjectMaterial, style: MaterialRowStyle = .compact) {
        self.material = material
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
            Text(material.name)
                .font(.headline)
            
            HStack {
                Text(material.quantity)
                    .foregroundColor(.secondary)
                Spacer()
                Text(material.estimatedCost, format: .currency(code: "USD"))
                    .foregroundColor(.secondary)
            }
            
            if let url = material.affiliateURL {
                Link("Purchase Link", destination: url)
                    .font(.caption)
                    .foregroundColor(.blue)
            }
        }
        .padding(.vertical, 4)
    }
    
    private var compactView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(material.name)
                    .font(.subheadline)
                Text(material.quantity)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            if let url = material.affiliateURL {
                Link(destination: url) {
                    HStack {
                        Text("$\(material.estimatedCost, specifier: "%.2f")")
                        Image(systemName: "cart")
                    }
                    .font(.subheadline)
                    .foregroundColor(.blue)
                }
            } else {
                Text("$\(material.estimatedCost, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 8)
    }
}

enum MaterialRowStyle {
    case detailed  // For editing/creation views
    case compact   // For list/overview views
} 