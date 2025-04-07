import SwiftUI

struct CustomButton: View {
    enum Style {
        case primary
        case secondary
    }
    
    let title: String
    let style: Style
    let action: () -> Void
    
    init(title: String, style: Style = .primary, action: @escaping () -> Void) {
        self.title = title
        self.style = style
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .foregroundColor(style == .primary ? .white : Color.theme.primary)
                .background(style == .primary ? Color.theme.primary : Color.clear)
                .cornerRadius(25)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.theme.primary, lineWidth: style == .secondary ? 2 : 0)
                )
        }
    }
} 