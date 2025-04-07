import SwiftUI

struct CustomTabBar: View {
    let tabs: [String]
    @Binding var selectedTab: Int
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(0..<tabs.count, id: \.self) { index in
                    Button(action: { selectedTab = index }) {
                        VStack(spacing: 8) {
                            Text(tabs[index])
                                .font(.subheadline)
                                .fontWeight(selectedTab == index ? .semibold : .regular)
                                .foregroundColor(selectedTab == index ? .primary : .secondary)
                            
                            Rectangle()
                                .fill(selectedTab == index ? Color.theme.primary : Color.clear)
                                .frame(height: 2)
                        }
                        .frame(width: UIScreen.main.bounds.width / CGFloat(tabs.count))
                    }
                }
            }
        }
        .background(Color.theme.cardBackground)
    }
} 