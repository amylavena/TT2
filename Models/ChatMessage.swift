import Foundation

extension ChatMessage {
    // Keep any additional methods or computed properties here
    
    static var sampleMessages: [ChatMessage] {
        let currentUserId = UserDefaults.standard.string(forKey: "currentUserId") ?? "currentUser"
        let now = Date()
        
        return [
            ChatMessage(
                type: .text,
                content: "I have an old staircase that isn't up to code and is a safety hazard for my toddler. I'm looking for some DIY options that will look nice and increase safety",
                timestamp: now.addingTimeInterval(-3600),
                senderId: currentUserId,
                status: .read
            ),
            ChatMessage(
                type: .text,
                content: "Hi Jorge! I'd be happy to help you make your staircase safer for your little one. I specialize in cost-effective DIY renovations that meet safety codes. Could you share a few photos of your current staircase?",
                timestamp: now.addingTimeInterval(-3500),
                senderId: "paul_smith",
                status: .read
            ),
            ChatMessage(
                type: .media,
                content: "Here are some photos of the staircase",
                timestamp: now.addingTimeInterval(-3400),
                senderId: currentUserId,
                attachments: [
                    ChatAttachment(
                        type: .image,
                        url: URL(string: "https://example.com/staircase1.jpg")!,
                        fileName: "staircase_front.jpg",
                        fileSize: 1024 * 1024
                    ),
                    ChatAttachment(
                        type: .image,
                        url: URL(string: "https://example.com/staircase2.jpg")!,
                        fileName: "staircase_side.jpg",
                        fileSize: 1024 * 1024
                    )
                ],
                status: .read
            ),
            ChatMessage(
                type: .text,
                content: "I see the issues - the railing height is too low and the spindles are too far apart. The good news is we can fix this without replacing the entire staircase. I can guide you through installing a new railing system and adding balusters to meet code requirements.",
                timestamp: now.addingTimeInterval(-3300),
                senderId: "paul_smith",
                status: .read
            ),
            ChatMessage(
                type: .text,
                content: "That sounds great! What would the process look like?",
                timestamp: now.addingTimeInterval(-3200),
                senderId: currentUserId,
                status: .read
            ),
            ChatMessage(
                type: .text,
                content: "I'll provide step-by-step guidance through video calls and chat. We'll start with measuring and planning, then I'll help you select materials and tools. I'll be available throughout the installation process to ensure everything is done correctly and safely.",
                timestamp: now.addingTimeInterval(-3100),
                senderId: "paul_smith",
                status: .read
            ),
            ChatMessage(
                type: .bookingOverview,
                content: "DIY Staircase Safety Renovation Consultation\n\nServices included:\n- Initial video consultation (30 min)\n- Material and tool selection guidance\n- Step-by-step installation support\n- 3 follow-up video calls\n- Unlimited chat support during project\n\nTotal Duration: 2 weeks\nPrice: $199",
                timestamp: now.addingTimeInterval(-3000),
                senderId: "paul_smith",
                status: .read
            ),
            ChatMessage(
                type: .text,
                content: "I've sent you a booking overview. This package includes everything you'll need to complete the project safely. Would you like to proceed with booking?",
                timestamp: now.addingTimeInterval(-2900),
                senderId: "paul_smith",
                status: .read
            ),
            ChatMessage(
                type: .text,
                content: "Hey Paul, I'm halfway through installing the new balusters but I've run into an issue. There's a small gap between some of them and the handrail. Is this normal?",
                timestamp: now.addingTimeInterval(-2800),
                senderId: currentUserId,
                status: .read
            ),
            ChatMessage(
                type: .media,
                content: "Here's what I'm seeing",
                timestamp: now.addingTimeInterval(-2790),
                senderId: currentUserId,
                attachments: [
                    ChatAttachment(
                        type: .image,
                        url: URL(string: "https://example.com/gap_issue.jpg")!,
                        fileName: "baluster_gap.jpg",
                        fileSize: 1024 * 1024
                    )
                ],
                status: .read
            ),
            ChatMessage(
                type: .text,
                content: "Good catch, Jorge! Those gaps can be fixed with baluster shoes - they're small decorative pieces that cover the connection points. I'll show you how to install them. Would you like to hop on a quick video call?",
                timestamp: now.addingTimeInterval(-2780),
                senderId: "paul_smith",
                status: .read
            ),
            ChatMessage(
                type: .text,
                content: "That would be great, thanks! I want to make sure I get this right for my kids' safety.",
                timestamp: now.addingTimeInterval(-2770),
                senderId: currentUserId,
                status: .read
            ),
            ChatMessage(
                type: .callRequest,
                content: "Video call started",
                timestamp: now.addingTimeInterval(-2760),
                senderId: "paul_smith",
                status: .read
            ),
            ChatMessage(
                type: .callEnded,
                content: "Video call ended",
                timestamp: now.addingTimeInterval(-2700),
                senderId: "paul_smith",
                callDuration: 600, // 10 minute call
                status: .read
            ),
            ChatMessage(
                type: .text,
                content: "Perfect, I understand now. I'll pick up those baluster shoes from the hardware store tomorrow.",
                timestamp: now.addingTimeInterval(-2690),
                senderId: currentUserId,
                status: .read
            )
        ]
    }
}

extension ChatAttachment {
    // Keep any additional methods or computed properties here
} 