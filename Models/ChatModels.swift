import SwiftUI

enum AttachmentType {
    case photo
    case image
    case video
    case document
    case audio
    
    var icon: String {
        switch self {
        case .photo, .image:
            return "photo"
        case .video:
            return "video"
        case .document:
            return "doc"
        case .audio:
            return "waveform"
        }
    }
}

enum ChatStatus {
    case online
    case offline
    case busy
    
    var description: String {
        switch self {
        case .online: return "Online"
        case .offline: return "Offline"
        case .busy: return "Busy"
        }
    }
}

enum MessageType {
    case text
    case media
    case callRequest
    case callEnded
    case quickReply
    case scheduledCall
    case bookingOverview
}

struct ChatMessage: Identifiable, Equatable {
    let id: UUID
    let type: MessageType
    let content: String
    let timestamp: Date
    let senderId: String
    let attachments: [ChatAttachment]
    let callDuration: TimeInterval?
    var status: MessageStatus
    var scheduledCallTime: Date?
    
    init(
        id: UUID = UUID(),
        type: MessageType = .text,
        content: String,
        timestamp: Date = Date(),
        senderId: String,
        attachments: [ChatAttachment] = [],
        callDuration: TimeInterval? = nil,
        status: MessageStatus = .sending,
        scheduledCallTime: Date? = nil
    ) {
        self.id = id
        self.type = type
        self.content = content
        self.timestamp = timestamp
        self.senderId = senderId
        self.attachments = attachments
        self.callDuration = callDuration
        self.status = status
        self.scheduledCallTime = scheduledCallTime
    }
    
    var isVideoCallRelated: Bool {
        switch type {
        case .callRequest, .callEnded:
            return true
        default:
            return false
        }
    }
    
    var isFromCurrentUser: Bool {
        let currentUserId = UserDefaults.standard.string(forKey: "currentUserId") ?? "currentUser"
        return senderId == currentUserId
    }
}

struct ChatAttachment: Identifiable, Equatable {
    let id: UUID
    let type: AttachmentType
    let url: URL
    let fileName: String
    let fileSize: Int64
    let thumbnailURL: URL?
    let uploadProgress: Double?
    
    init(
        id: UUID = UUID(),
        type: AttachmentType,
        url: URL,
        fileName: String,
        fileSize: Int64,
        thumbnailURL: URL? = nil,
        uploadProgress: Double? = nil
    ) {
        self.id = id
        self.type = type
        self.url = url
        self.fileName = fileName
        self.fileSize = fileSize
        self.thumbnailURL = thumbnailURL
        self.uploadProgress = uploadProgress
    }
    
    var formattedFileSize: String {
        return "\(fileSize) bytes"
    }
    
    static var sampleAttachments: [ChatAttachment] {
        [
            ChatAttachment(
                type: .image,
                url: URL(string: "https://example.com/image1.jpg")!,
                fileName: "kitchen_sketch.jpg",
                fileSize: 1024 * 1024,
                thumbnailURL: URL(string: "https://example.com/image1_thumb.jpg")
            ),
            ChatAttachment(
                type: .document,
                url: URL(string: "https://example.com/doc1.pdf")!,
                fileName: "project_plan.pdf",
                fileSize: 2048 * 1024,
                thumbnailURL: nil
            )
        ]
    }
}

enum MessageStatus {
    case sending
    case sent
    case delivered
    case read
    case failed
    
    var icon: String {
        switch self {
        case .sending:
            return "clock"
        case .sent:
            return "checkmark"
        case .delivered:
            return "checkmark.circle"
        case .read:
            return "checkmark.circle.fill"
        case .failed:
            return "exclamationmark.circle"
        }
    }
}

enum QuickReply: String, CaseIterable {
    case schedule = "Let's schedule a call to discuss this."
    case pricing = "Here's my pricing information:"
    case availability = "I'm available at the following times:"
    case thanks = "Thank you for reaching out!"
    
    var message: String { rawValue }
}

struct Conversation: Identifiable {
    let id: UUID
    let participant: User
    let lastMessage: ChatMessage
    let lastMessageTime: Date
    let unreadCount: Int
}

extension Conversation {
    static var sampleConversations: [Conversation] {
        let now = Date()
        return [
            Conversation(
                id: UUID(),
                participant: User(
                    name: "Paul Smith",
                    email: "paul.smith@tasktutor.com",
                    profilePhotoURL: nil
                ),
                lastMessage: ChatMessage(
                    type: .bookingOverview,
                    content: "DIY Staircase Safety Renovation Consultation\n\nServices included:\n- Initial video consultation (30 min)\n- Material and tool selection guidance\n- Step-by-step installation support\n- 3 follow-up video calls\n- Unlimited chat support during project\n\nTotal Duration: 2 weeks\nPrice: $199",
                    timestamp: now.addingTimeInterval(-2900),
                    senderId: "paul_smith",
                    status: .read
                ),
                lastMessageTime: now.addingTimeInterval(-2900),
                unreadCount: 1
            )
        ]
    }
} 