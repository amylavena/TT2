import SwiftUI

struct RateCard: View {
    let rate: Rate
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header
            HStack {
                Image(systemName: rate.type.icon)
                    .foregroundColor(Color.theme.primary)
                Text(rate.type.rawValue)
                    .font(.headline)
                    .foregroundColor(Color.theme.textPrimary)
            }
            
            // Rate Info
            HStack(alignment: .firstTextBaseline) {
                Text("$\(rate.price)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.primary)
                Text("/\(rate.duration) min")
                    .foregroundColor(Color.theme.textSecondary)
            }
            
            // Additional Info
            VStack(alignment: .leading, spacing: 8) {
                ForEach(rate.additionalInfo, id: \.self) { info in
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "circle.fill")
                            .font(.system(size: 6))
                            .foregroundColor(Color.theme.textSecondary)
                            .padding(.top, 6)
                        Text(info)
                            .font(.subheadline)
                            .foregroundColor(Color.theme.textSecondary)
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.theme.cardBackground)
        .cornerRadius(12)
        .shadow(
            color: Color.theme.shadowColor,
            radius: Color.theme.shadowRadius,
            x: 0,
            y: Color.theme.shadowY
        )
        .padding(.horizontal)
    }
}

struct PackageCard: View {
    let package: Rate
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(package.title)
                .font(.headline)
                .foregroundColor(Color.theme.textPrimary)
            
            Text(package.description)
                .font(.subheadline)
                .foregroundColor(Color.theme.textSecondary)
            
            HStack {
                Text("$\(package.price)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.primary)
                if let savings = package.additionalInfo.first {
                    Text(savings)
                        .foregroundColor(.green)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.theme.cardBackground)
        .cornerRadius(12)
        .shadow(
            color: Color.theme.shadowColor,
            radius: Color.theme.shadowRadius,
            x: 0,
            y: Color.theme.shadowY
        )
        .padding(.horizontal)
    }
} 