import SwiftUI

struct ProfileImage: View {
    let imageURL: String
    let size: CGFloat
    
    var body: some View {
        Image(systemName: "person.circle.fill")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: size, height: size)
            .foregroundColor(Color.theme.primary)
    }
} 