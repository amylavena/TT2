import SwiftUI

struct FilterPill: View {
    var icon: String? = nil
    let title: String
    let isActive: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 4) {
                if let icon = icon {
                    Image(systemName: icon)
                }
                
                Text(title)
                    .lineLimit(1)
                
                if isActive {
                    Image(systemName: "xmark")
                        .font(.caption)
                }
            }
            .font(.subheadline)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(isActive ? Color.theme.primary.opacity(0.1) : Color.gray.opacity(0.1))
            .foregroundColor(isActive ? Color.theme.primary : .primary)
            .cornerRadius(16)
        }
    }
}

struct FilterComponents_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            FilterPill(
                icon: "line.3.horizontal.decrease.circle",
                title: "Filters",
                isActive: true,
                action: {}
            )
            
            FilterPill(
                title: "Active Filter",
                isActive: true,
                action: {}
            )
            
            FilterPill(
                title: "Inactive Filter",
                isActive: false,
                action: {}
            )
        }
        .padding()
    }
} 