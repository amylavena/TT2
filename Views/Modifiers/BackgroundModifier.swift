import SwiftUI

struct BackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                ZStack {
                    // Base background color (warm tan)
                    Color(red: 0.82, green: 0.65, blue: 0.41)
                        .ignoresSafeArea()
                    
                    // Gradient overlay
                    LinearGradient(
                        stops: [
                            Gradient.Stop(color: Color(red: 0.07, green: 0.07, blue: 0.07).opacity(0.75), location: 0.00),
                            Gradient.Stop(color: Color(red: 0.2, green: 0.2, blue: 0.2).opacity(0.95), location: 1.00),
                        ],
                        startPoint: UnitPoint(x: 0.71, y: 1.29),
                        endPoint: UnitPoint(x: 1.29, y: 0.29)
                    )
                    .ignoresSafeArea()
                }
            )
    }
}

extension View {
    func appBackground() -> some View {
        self.modifier(BackgroundModifier())
    }
} 