import SwiftUI

struct UploadToolView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = UploadToolViewModel()
    @State private var showImagePicker = false
    
    var body: some View {
        NavigationView {
            Form {
                // Tool Photos
                Section("Tool Photos") {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            Button(action: { showImagePicker = true }) {
                                VStack {
                                    Image(systemName: "plus")
                                        .font(.title)
                                    Text("Add Photo")
                                        .font(.caption)
                                }
                                .foregroundColor(Color.theme.primary)
                                .frame(width: 100, height: 100)
                                .background(Color.theme.cardBackground)
                                .cornerRadius(8)
                            }
                            
                            ForEach(viewModel.selectedImages, id: \.self) { image in
                                Image(uiImage: image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                    .overlay(
                                        Button(action: { viewModel.removeImage(image) }) {
                                            Image(systemName: "xmark.circle.fill")
                                                .foregroundColor(.white)
                                                .padding(4)
                                        }
                                        .background(Color.black.opacity(0.5))
                                        .clipShape(Circle())
                                        .padding(4),
                                        alignment: .topTrailing
                                    )
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
                
                // Basic Info
                Section("Basic Information") {
                    TextField("Tool Name", text: $viewModel.toolName)
                    TextField("Brand", text: $viewModel.brand)
                    TextField("Price", text: $viewModel.price)
                        .keyboardType(.decimalPad)
                    TextField("Location", text: $viewModel.location)
                }
                
                // Category
                Section("Category") {
                    ToolCategoryList(
                        categories: ToolCategory.allCases.filter { $0 != .all },
                        selectedCategory: viewModel.category,
                        onSelect: { viewModel.category = $0 }
                    )
                }
                
                // Description
                Section("Description") {
                    TextEditor(text: $viewModel.description)
                        .frame(height: 100)
                }
            }
            .navigationTitle("Sell a Tool")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Post") {
                        viewModel.uploadTool()
                        dismiss()
                    }
                    .disabled(!viewModel.isValidForm)
                }
            }
            .sheet(isPresented: $showImagePicker) {
                PhotoLibraryPicker(images: $viewModel.selectedImages, selectionLimit: 5)
            }
        }
    }
}

struct UploadToolView_Previews: PreviewProvider {
    static var previews: some View {
        UploadToolView()
    }
} 