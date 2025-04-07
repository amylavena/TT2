import SwiftUI

struct CoachCard: View {
    let coach: Coach
    private let sageGreen = Color(red: 0.47, green: 0.53, blue: 0.45)
    private let sandColor = Color(hex: "C4A484")
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 16) {
                // Profile Image
                let imageToLoad = coach.imageURL
                
                Group {
                    if let uiImage = UIImage(named: imageToLoad) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80)
                            .scaledToFill()
                            .clipShape(Circle())
                            .offset(x: 0, y: 2)
                    } else {
                        Image(systemName: "person.fill")
                            .foregroundColor(.gray)
                            .frame(width: 80, height: 80)
                    }
                }
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .background(
                    Circle()
                        .fill(Color.gray.opacity(0.1))
                        .frame(width: 80, height: 80)
                )
                .onAppear {
                    print("DEBUG: ----Image Loading Debug----")
                    print("DEBUG: Coach name: \(coach.name)")
                    print("DEBUG: Image name to load: \(imageToLoad)")
                    print("DEBUG: Direct image check: \(UIImage(named: "ted_profile") != nil)")
                    print("DEBUG: Image exists: \(UIImage(named: imageToLoad) != nil)")
                    
                    // Try different variations
                    let variations = [
                        imageToLoad,
                        imageToLoad.replacingOccurrences(of: "Coaches/", with: ""),
                        "Assets.xcassets/\(imageToLoad)",
                        "Assets.xcassets/Coaches/\(imageToLoad)"
                    ]
                    
                    variations.forEach { path in
                        print("DEBUG: Trying path: \(path) - exists: \(UIImage(named: path) != nil)")
                    }
                }
                
                // Name and rating
                VStack(alignment: .leading, spacing: 4) {
                    Text(coach.name)
                        .font(.headline)
                        .foregroundColor(.black.opacity(0.8))
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(sandColor)
                        Text(String(format: "%.1f", coach.rating))
                        Text("(\(coach.reviewCount) reviews)")
                            .foregroundColor(.gray)
                    }
                    .font(.subheadline)
                }
                
                Spacer()
                
                // Hourly rate
                Text("$\(coach.hourlyRate)/hr")
                    .font(.headline)
                    .foregroundColor(sageGreen)
            }
            
            // Skills
            FlowLayout(
                spacing: 8,
                data: coach.skills
            ) { skill in
                Text(skill)
                    .font(.subheadline)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(sageGreen.opacity(0.1))
                    .foregroundColor(sageGreen)
                    .cornerRadius(16)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(sageGreen.opacity(0.1), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.03), radius: 10, x: 0, y: 5)
    }
} 