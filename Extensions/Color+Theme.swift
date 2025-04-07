import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    // Base Colors
    let background = Color(red: 0.98, green: 0.98, blue: 0.98) // Light gray background
    let cardBackground = Color.white
    
    // Brand Colors - Using a sage green palette
    let primary = Color(red: 0.53, green: 0.66, blue: 0.57)    // Sage green
    let secondary = Color(red: 0.76, green: 0.84, blue: 0.78)  // Light sage
    let accent = Color(red: 0.33, green: 0.46, blue: 0.37)     // Dark sage
    
    // Text Colors
    let textPrimary = Color(red: 0.2, green: 0.2, blue: 0.2)   // Almost black
    let textSecondary = Color(red: 0.6, green: 0.6, blue: 0.6) // Medium gray
    
    // UI Elements
    let border = Color(red: 0.93, green: 0.93, blue: 0.93)     // Light gray border
    let success = Color(red: 0.33, green: 0.73, blue: 0.49)    // Green
    let error = Color(red: 0.95, green: 0.33, blue: 0.33)      // Red
    
    // Shadows
    let shadowColor = Color.black.opacity(0.04)
    let shadowRadius: CGFloat = 24
    let shadowY: CGFloat = 2
    
    // Semi-transparent versions
    var primaryLight: Color {
        Color(
            red: 0.53,
            green: 0.66,
            blue: 0.57,
            opacity: 0.1  // Set opacity here instead
        )
    }
} 