import SwiftUI

struct FlowLayout<Data: Collection, Content: View>: View where Data.Element: Hashable {
    let spacing: CGFloat
    let data: Data
    let content: (Data.Element) -> Content
    
    init(spacing: CGFloat = 8, data: Data, @ViewBuilder content: @escaping (Data.Element) -> Content) {
        self.spacing = spacing
        self.data = data
        self.content = content
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
    }
    
    private func generateContent(in geometry: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        var lastHeight = CGFloat.zero
        
        return ZStack(alignment: .topLeading) {
            ForEach(Array(data.enumerated()), id: \.1) { index, item in
                content(item)
                    .padding(.horizontal, spacing)
                    .padding(.vertical, 4)
                    .alignmentGuide(.leading) { dimension in
                        if width + dimension.width + spacing > geometry.size.width {
                            width = 0
                            height -= lastHeight
                            lastHeight = 0
                        }
                        
                        let result = width
                        if index == data.count - 1 {
                            width = 0
                        } else {
                            width += dimension.width + spacing
                            lastHeight = max(lastHeight, dimension.height)
                        }
                        return result
                    }
                    .alignmentGuide(.top) { dimension in
                        let result = height
                        if index == data.count - 1 {
                            height = 0
                        }
                        return result
                    }
            }
        }
    }
} 
