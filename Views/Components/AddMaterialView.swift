import SwiftUI

struct AddMaterialView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var materials: [ProjectMaterial]
    
    @State private var name = ""
    @State private var quantity = ""
    @State private var estimatedCost: Double = 0
    @State private var affiliateURL = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section("Material Details") {
                    TextField("Name", text: $name)
                    TextField("Quantity", text: $quantity)
                    TextField("Estimated Cost", value: $estimatedCost, format: .currency(code: "USD"))
                        .keyboardType(.decimalPad)
                    TextField("Affiliate Link (Optional)", text: $affiliateURL)
                        .keyboardType(.URL)
                        .autocapitalization(.none)
                }
            }
            .navigationTitle("Add Material")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        let newMaterial = ProjectMaterial(
                            name: name,
                            quantity: quantity,
                            estimatedCost: estimatedCost,
                            affiliateURL: URL(string: affiliateURL)
                        )
                        materials.append(newMaterial)
                        dismiss()
                    }
                    .disabled(name.isEmpty || quantity.isEmpty || estimatedCost <= 0)
                }
            }
        }
    }
} 