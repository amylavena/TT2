import SwiftUI
import PhotosUI

struct InitialRegistrationView: View {
    @StateObject private var viewModel = RegistrationViewModel()
    @State private var selectedImages: [UIImage] = []
    @State private var showCameraPicker = false
    
    var body: some View {
        VStack(spacing: 24) {
            // Profile Photo Section
            VStack(spacing: 16) {
                if let profileImage = selectedImages.first {
                    Image(uiImage: profileImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .foregroundColor(.gray)
                }
                
                HStack(spacing: 16) {
                    Button(action: { viewModel.showImagePicker = true }) {
                        Text("Choose Photo")
                            .font(.headline)
                            .foregroundColor(Color.theme.primary)
                    }
                    
                    Button(action: { showCameraPicker = true }) {
                        Text("Take Photo")
                            .font(.headline)
                            .foregroundColor(Color.theme.primary)
                    }
                }
            }
            
            // Basic Info Form
            VStack(spacing: 16) {
                CustomTextField(
                    title: "Full Name",
                    text: $viewModel.fullName,
                    placeholder: "Enter your full name"
                )
                
                CustomTextField(
                    title: "Email",
                    text: $viewModel.email,
                    placeholder: "Enter your email",
                    keyboardType: .emailAddress,
                    autocapitalization: .never
                )
                
                CustomTextField(
                    title: "Phone Number",
                    text: $viewModel.phoneNumber,
                    placeholder: "Enter your phone number",
                    keyboardType: .phonePad
                )
                
                CustomTextField(
                    title: "Password",
                    text: $viewModel.password,
                    placeholder: "Create a password",
                    isSecure: true
                )
            }
            
            // Continue Button
            Button(action: { viewModel.sendVerification() }) {
                Text("Continue")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(viewModel.isBasicInfoValid ? Color.theme.primary : Color.gray)
                    .cornerRadius(25)
            }
            .disabled(!viewModel.isBasicInfoValid)
        }
        .padding()
        .sheet(isPresented: $viewModel.showImagePicker) {
            PhotoLibraryPicker(images: $selectedImages, selectionLimit: 1)
                .onChange(of: selectedImages) { _, newImages in
                    if let image = newImages.first {
                        viewModel.profileImage = image
                    }
                }
        }
        .sheet(isPresented: $showCameraPicker) {
            DeviceCameraPicker(image: $viewModel.profileImage)
        }
    }
}

struct InitialRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        InitialRegistrationView()
    }
} 