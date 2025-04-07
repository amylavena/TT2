import SwiftUI

struct StatCard: View {
    let value: String
    let unit: String
    let label: String
    
    var body: some View {
        VStack(spacing: 4) {
            HStack(alignment: .firstTextBaseline, spacing: 2) {
                Text(value)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(unit)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(width: 100)
        .padding()
        .background(Color.theme.cardBackground)
        .cornerRadius(12)
    }
} 