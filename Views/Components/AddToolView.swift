import SwiftUI

struct AddToolView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var tools: [Tool]
    
    @State private var name = ""
    @State private var description = ""
    @State private var category: ToolCategory = .handTools
    
    var body: some View {
        NavigationView {
            Form {
                Section("Tool Details") {
                    TextField("Name", text: $name)
                    TextField("Description", text: $description)
                    Picker("Category", selection: $category) {
                        ForEach(ToolCategory.allCases, id: \.self) { category in
                            Text(category.rawValue).tag(category)
                        }
                    }
                }
            }
            .navigationTitle("Add Tool")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        let newTool = Tool(
                            name: name,
                            description: description,
                            category: category
                        )
                        tools.append(newTool)
                        dismiss()
                    }
                    .disabled(name.isEmpty || description.isEmpty)
                }
            }
        }
    }
} 