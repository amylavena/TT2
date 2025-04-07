import SwiftUI

class UploadToolViewModel: ObservableObject {
    @Published var selectedImages: [UIImage] = []
    @Published var toolName = ""
    @Published var description = ""
    @Published var category: ToolCategory?
    @Published var price = ""
    @Published var location = ""
    @Published var brand = ""
    
    var isValidForm: Bool {
        !selectedImages.isEmpty &&
        !toolName.isEmpty &&
        !description.isEmpty &&
        category != nil &&
        !price.isEmpty &&
        !location.isEmpty &&
        !brand.isEmpty
    }
    
    func removeImage(_ image: UIImage) {
        selectedImages.removeAll { $0 == image }
    }
    
    func uploadTool() {
        guard let category = category,
              let price = Double(price),
              let currentUser = UserViewModel().currentUser else { return }
        
        _ = MarketplaceTool(
            name: toolName,
            description: description,
            category: category,
            price: price,
            imageURL: "",
            location: location,
            isAvailable: true,
            owner: currentUser,
            brand: brand
        )
    }
} 