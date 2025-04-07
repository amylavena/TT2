import SwiftUI
import Foundation

struct CallsListView: View {
    @StateObject private var viewModel = CallsViewModel()
    
    var body: some View {
        LazyVStack(spacing: 1) {
            ForEach(viewModel.calls) { call in
                CallRow(call: call)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 4)
            }
        }
        .padding(.top, 8)
    }
}

struct CallRow: View {
    let call: Call
    
    var body: some View {
        HStack(spacing: 12) {
            // Profile Image
            if let photoURL = call.participant.profilePhotoURL,
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
            
            // Call Details
            VStack(alignment: .leading, spacing: 2) {
                Text(call.participant.name)
                    .font(.headline)
                    .foregroundColor(Color.theme.primary)
                
                HStack(spacing: 4) {
                    // Call type icon
                    Image(systemName: call.type.icon)
                        .foregroundColor(call.status.color)
                    
                    // Call status
                    Text(call.status.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    if let duration = call.duration {
                        Text("• \(formatDuration(duration))")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
            
            Spacer()
            
            // Timestamp
            VStack(alignment: .trailing, spacing: 2) {
                Text(call.timestamp.timeAgoDisplay())
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Button(action: { /* Initiate call */ }) {
                    Image(systemName: call.type == .video ? "video" : "phone")
                        .foregroundColor(Color.theme.primary)
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
            .overlay(
                Text(call.participant.name.prefix(1))
                    .font(.system(size: 20))
                    .foregroundColor(Color.theme.primary)
            )
    }
    
    private func formatDuration(_ duration: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: duration) ?? "0:00"
    }
}

// Add these models
struct Call: Identifiable {
    let id: UUID
    let participant: User
    let timestamp: Date
    let type: CallType
    let status: CallStatus
    let duration: TimeInterval?
    
    enum CallType {
        case audio
        case video
        
        var icon: String {
            switch self {
            case .audio: return "phone"
            case .video: return "video"
            }
        }
    }
    
    enum CallStatus {
        case missed
        case outgoing
        case incoming
        case declined
        
        var description: String {
            switch self {
            case .missed: return "Missed"
            case .outgoing: return "Outgoing"
            case .incoming: return "Incoming"
            case .declined: return "Declined"
            }
        }
        
        var color: Color {
            switch self {
            case .missed, .declined: return .red
            case .outgoing, .incoming: return .green
            }
        }
    }
}

class CallsViewModel: ObservableObject {
    @Published var calls: [Call] = []
    
    init() {
        loadCalls()
    }
    
    private func loadCalls() {
        // Sample data showing call history between Jorge and his coach Paul
        calls = [
            Call(
                id: UUID(),
                participant: User(name: "Paul Smith", email: "paul.smith@tasktutor.com", profilePhotoURL: nil),
                timestamp: Date().addingTimeInterval(-1800), // 30 minutes ago
                type: Call.CallType.video,
                status: Call.CallStatus.incoming,
                duration: 1800 // 30 minute consultation about staircase safety
            ),
            Call(
                id: UUID(),
                participant: User(name: "Paul Smith", email: "paul.smith@tasktutor.com", profilePhotoURL: nil),
                timestamp: Date().addingTimeInterval(-86400), // 1 day ago
                type: Call.CallType.video,
                status: Call.CallStatus.missed,
                duration: nil // Missed call during initial consultation attempt
            ),
            Call(
                id: UUID(),
                participant: User(name: "Paul Smith", email: "paul.smith@tasktutor.com", profilePhotoURL: nil),
                timestamp: Date().addingTimeInterval(-172800), // 2 days ago
                type: Call.CallType.audio,
                status: Call.CallStatus.outgoing,
                duration: 600 // 10 minute quick call about material costs
            ),
            Call(
                id: UUID(),
                participant: User(name: "Paul Smith", email: "paul.smith@tasktutor.com", profilePhotoURL: nil),
                timestamp: Date().addingTimeInterval(-259200), // 3 days ago
                type: Call.CallType.video,
                status: Call.CallStatus.outgoing,
                duration: 1200 // 20 minute initial consultation about staircase project
            )
        ]
    }
} 