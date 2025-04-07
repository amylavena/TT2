import SwiftUI
import Foundation

class ChatListViewModel: ObservableObject {
    @Published var selectedTab = 0
    @Published var conversations: [Conversation] = []
    @Published var isLoading = false
    
    init() {
        loadConversations()
    }
    
    private func loadConversations() {
        conversations = Conversation.sampleConversations
    }
} 