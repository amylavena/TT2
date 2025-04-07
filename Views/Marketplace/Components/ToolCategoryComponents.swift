import SwiftUI

struct ToolCategoryList: View {
    let categories: [ToolCategory]
    let selectedCategory: ToolCategory?
    let onSelect: (ToolCategory) -> Void
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(categories) { category in
                    CategoryPill(
                        category: category,
                        isSelected: selectedCategory == category,
                        action: { onSelect(category) }
                    )
                }
            }
            .padding(.horizontal)
        }
    }
} 