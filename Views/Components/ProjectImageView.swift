import SwiftUI

struct ProjectImageView: View {
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
} 