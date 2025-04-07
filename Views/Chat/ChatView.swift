import SwiftUI
import PhotosUI
import AVKit

struct ChatView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel: ChatViewModel
    @FocusState private var isTextFieldFocused: Bool
    
    init(recipient: User) {
        _viewModel = StateObject(wrappedValue: ChatViewModel(recipient: recipient))
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Chat Header with back button
            HStack(spacing: 12) {
                Button(action: { presentationMode.wrappedValue.dismiss() }) {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .foregroundColor(Color.theme.primary)
                }
                
                if let photoURL = viewModel.recipient.profilePhotoURL,
                   let url = URL(string: photoURL) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        defaultProfileImage
                    }
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())
                } else {
                    defaultProfileImage
                        .frame(width: 36, height: 36)
                }
                
                VStack(alignment: .leading, spacing: 1) {
                    Text(viewModel.recipient.name)
                        .font(.headline)
                    
                    Text(viewModel.chatStatus.description)
                        .font(.caption)
                        .foregroundColor(viewModel.chatStatus == .online ? .green : .gray)
                }
                
                Spacer()
                
                Button(action: { viewModel.initiateAudioCall() }) {
                    Image(systemName: "phone")
                        .font(.title3)
                        .foregroundColor(Color.theme.primary)
                }
                
                Button(action: { viewModel.initiateVideoCall() }) {
                    Image(systemName: "video")
                        .font(.title3)
                        .foregroundColor(Color.theme.primary)
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color.theme.cardBackground)
            
            // Messages
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(viewModel.messages) { message in
                            MessageView(message: message)
                        }
                        
                        if viewModel.isRecipientTyping {
                            TypingIndicator()
                        }
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                }
                .onChange(of: viewModel.messages.count) { _ in
                    if let lastMessage = viewModel.messages.last {
                        withAnimation {
                            proxy.scrollTo(lastMessage.id, anchor: .bottom)
                        }
                    }
                }
                .onChange(of: viewModel.isRecipientTyping) { _ in
                    withAnimation {
                        proxy.scrollTo("typing", anchor: .bottom)
                    }
                }
            }
            
            // Message Input
            messageInput
        }
        .navigationBarHidden(true)
        .sheet(isPresented: $viewModel.showAttachmentPicker) {
            PhotoLibraryPicker(images: $viewModel.selectedAttachments)
        }
        .sheet(isPresented: $viewModel.showDocumentPicker) {
            DocumentPicker()
        }
        .sheet(isPresented: $viewModel.showVideoCallSheet) {
            VideoCallView(viewModel: viewModel)
        }
        .alert("Incoming Video Call", isPresented: $viewModel.incomingVideoCall) {
            Button("Accept") {
                viewModel.acceptVideoCall()
                viewModel.showVideoCallSheet = true
            }
            Button("Decline", role: .cancel) {
                viewModel.declineVideoCall()
            }
        } message: {
            Text(viewModel.recipient.name + " is calling...")
        }
    }
    
    private var defaultProfileImage: some View {
        Circle()
            .fill(Color.gray.opacity(0.2))
            .overlay(
                Text(viewModel.recipient.name.prefix(1))
                    .font(.system(size: 20))
                    .foregroundColor(Color.theme.primary)
            )
    }
    
    private var messageInput: some View {
        VStack(spacing: 0) {
            if !viewModel.selectedAttachments.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(viewModel.selectedAttachments, id: \.self) { image in
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 60)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .overlay(
                                    Button(action: {
                                        viewModel.selectedAttachments.removeAll { $0 == image }
                                    }) {
                                        Image(systemName: "xmark.circle.fill")
                                            .foregroundColor(.white)
                                            .background(Color.black.opacity(0.5))
                                            .clipShape(Circle())
                                    }
                                    .padding(4),
                                    alignment: .topTrailing
                                )
                        }
                    }
                    .padding()
                }
            }
            
            if viewModel.showQuickReplies {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(viewModel.quickReplies, id: \.self) { reply in
                            Button(action: { viewModel.sendQuickReply(reply) }) {
                                Text(reply.message)
                                    .font(.caption)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background(Color.theme.primary.opacity(0.1))
                                    .foregroundColor(Color.theme.primary)
                                    .cornerRadius(16)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            Divider()
            
            HStack(spacing: 16) {
                Menu {
                    Button(action: { viewModel.showAttachmentPicker = true }) {
                        Label("Photo", systemImage: "photo")
                    }
                    Button(action: { viewModel.showDocumentPicker = true }) {
                        Label("Document", systemImage: "doc")
                    }
                } label: {
                    Image(systemName: "paperclip")
                        .font(.title3)
                        .foregroundColor(Color.theme.primary)
                }
                
                TextField("Type a message...", text: $viewModel.messageText)
                    .textFieldStyle(.plain)
                    .focused($isTextFieldFocused)
                
                if !viewModel.selectedAttachments.isEmpty {
                    Button(action: viewModel.sendAttachments) {
                        Image(systemName: "arrow.up.circle.fill")
                            .font(.title2)
                            .foregroundColor(Color.theme.primary)
                    }
                } else {
                    Button(action: viewModel.sendMessage) {
                        Image(systemName: "arrow.up.circle.fill")
                            .font(.title2)
                            .foregroundColor(viewModel.messageText.isEmpty ? .gray : Color.theme.primary)
                    }
                    .disabled(viewModel.messageText.isEmpty)
                }
            }
            .padding()
            .background(Color.theme.cardBackground)
        }
    }
}

// MARK: - Message View
struct MessageView: View {
    let message: ChatMessage
    private let sageGreen = Color(red: 0.47, green: 0.53, blue: 0.45)
    
    var body: some View {
        VStack(alignment: message.isFromCurrentUser ? .trailing : .leading, spacing: 4) {
            if message.isVideoCallRelated {
                videoCallMessage
            } else if !message.attachments.isEmpty {
                attachmentMessage
            } else {
                textMessage
            }
            
            Text(timeString(from: message.timestamp))
                .font(.caption2)
                .foregroundColor(.gray)
                .padding(.horizontal, 4)
        }
        .frame(maxWidth: .infinity, alignment: message.isFromCurrentUser ? .trailing : .leading)
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
    }
    
    private var textMessage: some View {
        Text(message.content)
            .font(.system(size: 16))
            .foregroundColor(message.isFromCurrentUser ? .white : .black)
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(
                Group {
                    if message.isFromCurrentUser {
                        sageGreen
                    } else {
                        Color(UIColor.systemGray6)
                    }
                }
            )
            .cornerRadius(20, corners: message.isFromCurrentUser ? [.topLeft, .topRight, .bottomLeft] : [.topLeft, .topRight, .bottomRight])
    }
    
    private var attachmentMessage: some View {
        VStack(alignment: .leading, spacing: 8) {
            if !message.content.isEmpty {
                Text(message.content)
                    .font(.system(size: 16))
                    .foregroundColor(message.isFromCurrentUser ? .white : .black)
            }
            
            ForEach(message.attachments) { attachment in
                HStack {
                    Image(systemName: attachment.type == .image ? "photo" : "doc")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    VStack(alignment: .leading) {
                        Text(attachment.fileName)
                            .font(.system(size: 14))
                        Text(formatFileSize(attachment.fileSize))
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "arrow.down.circle")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
                .padding(8)
                .background(Color.white)
                .cornerRadius(12)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(
            message.isFromCurrentUser 
            ? sageGreen
            : Color(UIColor.systemGray6)
        )
        .cornerRadius(20, corners: message.isFromCurrentUser ? [.topLeft, .topRight, .bottomLeft] : [.topLeft, .topRight, .bottomRight])
    }
    
    private var videoCallMessage: some View {
        HStack(spacing: 8) {
            Image(systemName: "video")
                .foregroundColor(.gray)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(message.content)
                    .font(.system(size: 16))
                if let duration = message.callDuration {
                    Text(formatDuration(duration))
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(20)
    }
    
    private func formatFileSize(_ size: Int64) -> String {
        let formatter = ByteCountFormatter()
        formatter.allowedUnits = [.useKB, .useMB]
        formatter.countStyle = .file
        return formatter.string(fromByteCount: size)
    }
    
    private func timeString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    private func formatDuration(_ duration: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: duration) ?? "0:00:00"
    }
}

// MARK: - Attachment View
struct AttachmentView: View {
    let attachment: ChatAttachment
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: attachment.type.icon)
                .font(.title2)
                .foregroundColor(Color.theme.primary)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(attachment.fileName)
                    .font(.subheadline)
                    .lineLimit(1)
                
                Text(attachment.formattedFileSize)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Button(action: { /* TODO: Download attachment */ }) {
                Image(systemName: "arrow.down.circle")
                    .font(.title3)
                    .foregroundColor(Color.theme.primary)
            }
        }
        .padding()
        .background(Color.theme.cardBackground.opacity(0.5))
        .cornerRadius(12)
    }
}

// MARK: - Video Call View
struct VideoCallView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: ChatViewModel
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text(viewModel.formatDuration(viewModel.videoCallDuration))
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                
                Spacer()
                
                HStack(spacing: 40) {
                    Button(action: { /* TODO: Toggle camera */ }) {
                        Image(systemName: "camera.rotate")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.gray.opacity(0.5))
                            .clipShape(Circle())
                    }
                    
                    Button(action: {
                        viewModel.endVideoCall()
                        dismiss()
                    }) {
                        Image(systemName: "phone.down.fill")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .clipShape(Circle())
                    }
                    
                    Button(action: { /* TODO: Toggle microphone */ }) {
                        Image(systemName: "mic")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.gray.opacity(0.5))
                            .clipShape(Circle())
                    }
                }
                .padding(.bottom, 40)
            }
        }
    }
}

// MARK: - Document Picker
struct DocumentPicker: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let picker = UIDocumentPickerViewController(forOpeningContentTypes: [.pdf, .text])
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}
}

// MARK: - Media Picker
struct MediaPicker: UIViewControllerRepresentable {
    @Binding var images: [UIImage]
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        config.selectionLimit = 5
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: MediaPicker
        
        init(_ parent: MediaPicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            
            for result in results {
                if result.itemProvider.canLoadObject(ofClass: UIImage.self) {
                    result.itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                        if let image = image as? UIImage {
                            DispatchQueue.main.async {
                                self.parent.images.append(image)
                            }
                        }
                    }
                }
            }
        }
    }
}

// MARK: - Typing Indicator
struct TypingIndicator: View {
    @State private var animationOffset: CGFloat = 0
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<3) { index in
                Circle()
                    .fill(Color.secondary)
                    .frame(width: 6, height: 6)
                    .offset(y: animationOffset)
                    .animation(
                        Animation.easeInOut(duration: 0.5)
                            .repeatForever()
                            .delay(0.15 * Double(index)),
                        value: animationOffset
                    )
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(Color.theme.cardBackground)
        .cornerRadius(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .id("typing")
        .onAppear {
            animationOffset = -5
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChatView(recipient: User(name: "John Smith", email: "john@example.com", profilePhotoURL: ""))
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
} 