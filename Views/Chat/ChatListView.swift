import SwiftUI

struct ChatListView: View {
    @StateObject private var viewModel = ChatListViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            // Custom Navigation Bar
            HStack {
                Text("Inbox")
                    .font(.headline)
                Spacer()
                Button(action: { /* Add new chat */ }) {
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(Color.theme.primary)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color.white)
            
            // Segmented Control
            Picker("View", selection: $viewModel.selectedTab) {
                Text("Chats").tag(0)
                Text("Calls").tag(1)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            
            // Content based on selected tab
            if viewModel.selectedTab == 0 {
                // Chats List
                ScrollView {
                    LazyVStack(spacing: 1) {
                        ForEach(viewModel.conversations) { conversation in
                            NavigationLink(destination: ChatView(recipient: conversation.participant)) {
                                ChatRow(conversation: conversation)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 4)
                            }
                        }
                    }
                    .padding(.top, 8)
                }
            } else {
                // Calls List
                ScrollView {
                    CallsListView()
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct ChatRow: View {
    let conversation: Conversation
    private let sageGreen = Color(red: 0.47, green: 0.53, blue: 0.45)
    
    var body: some View {
        HStack(spacing: 12) {
            // Profile Image
            if let photoURL = conversation.participant.profilePhotoURL,
               let url = URL(string: photoURL) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    defaultProfileImage
                }
                .frame(width: 44, height: 44)
                .clipShape(Circle())
            } else {
                defaultProfileImage
                    .frame(width: 44, height: 44)
            }
            
            // Message Preview
            VStack(alignment: .leading, spacing: 2) {
                HStack {
                    Text(conversation.participant.name)
                        .font(.headline)
                        .foregroundColor(Color.theme.primary)
                    
                    Spacer()
                    
                    Text(conversation.lastMessageTime.timeAgoDisplay())
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    if conversation.lastMessage.isFromCurrentUser {
                        Image(systemName: conversation.lastMessage.status.icon)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Text(conversation.lastMessage.content)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    if conversation.unreadCount > 0 {
                        Text("\(conversation.unreadCount)")
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(Color.theme.primary)
                            .clipShape(Capsule())
                    }
                }
            }
        }
        .padding(.vertical, 4)
        .background(Color.theme.cardBackground)
        .cornerRadius(12)
    }
    
    private var defaultProfileImage: some View {
        Circle()
            .fill(Color.gray.opacity(0.2))
            .frame(width: 50, height: 50)
            .overlay(
                Text(conversation.participant.name.prefix(1))
                    .font(.system(size: 20))
                    .foregroundColor(Color.theme.primary)
            )
    }
}

// Add this extension to format dates
extension Date {
    func timeAgoDisplay() -> String {
        let calendar = Calendar.current
        let now = Date()
        let components = calendar.dateComponents([.minute, .hour, .day, .weekOfYear, .month, .year], from: self, to: now)
        
        if let year = components.year, year >= 1 {
            return DateFormatter.localizedString(from: self, dateStyle: .short, timeStyle: .none)
        }
        if let month = components.month, month >= 1 {
            return DateFormatter.localizedString(from: self, dateStyle: .short, timeStyle: .none)
        }
        if let week = components.weekOfYear, week >= 1 {
            return "\(week)w ago"
        }
        if let day = components.day, day >= 1 {
            return day == 1 ? "Yesterday" : "\(day)d ago"
        }
        if let hour = components.hour, hour >= 1 {
            return "\(hour)h ago"
        }
        if let minute = components.minute, minute >= 1 {
            return "\(minute)m ago"
        }
        return "Just now"
    }
} 