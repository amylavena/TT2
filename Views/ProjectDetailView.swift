import SwiftUI

struct ProjectDetailView: View {
    let project: DIYProject
    @State private var selectedTab = 0
    private let sageGreen = Color(red: 0.47, green: 0.53, blue: 0.45)
    private let sandColor = Color(hex: "C4A484")
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // Project Image
                if let image = UIImage(named: project.thumbnailURL) {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                        .clipped()
                } else {
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 300)
                }
                
                VStack(alignment: .leading, spacing: 24) {
                    // Title
                    Text(project.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black.opacity(0.8))
                    
                    // Creator Info
                    HStack(spacing: 12) {
                        Circle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 50, height: 50)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("John Woodworker")
                                .font(.headline)
                                .foregroundColor(.black.opacity(0.8))
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundColor(sandColor)
                                Text("4.9")
                                Text("•")
                                Text("15 projects")
                                    .foregroundColor(.gray)
                            }
                            .font(.subheadline)
                        }
                    }
                    
                    // Stats
                    HStack(spacing: 16) {
                        StatBadge(icon: "clock", text: "6 hrs", iconColor: sageGreen)
                        StatBadge(icon: "star.fill", text: "4.8", iconColor: sandColor)
                        StatBadge(icon: "person.2.fill", text: "127", iconColor: sageGreen)
                    }
                    
                    // Tabs
                    CustomTabBar(
                        tabs: ["Overview", "Materials", "Instructions", "Comments"],
                        selectedTab: $selectedTab
                    )
                    .accentColor(sageGreen)
                    
                    // Tab Content
                    switch selectedTab {
                    case 0:
                        OverviewContent(project: project, sageGreen: sageGreen, sandColor: sandColor)
                    case 1:
                        MaterialsContent(project: project, sageGreen: sageGreen)
                    case 2:
                        InstructionsContent(project: project, sageGreen: sageGreen)
                    case 3:
                        CommentsContent(project: project, sageGreen: sageGreen, sandColor: sandColor)
                    default:
                        EmptyView()
                    }
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if project.isPremium {
                    Button("Purchase $14.99") {
                        // Purchase action
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(sageGreen)
                    .cornerRadius(20)
                }
            }
        }
    }
}

struct StatBadge: View {
    let icon: String
    let text: String
    let iconColor: Color
    
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: icon)
                .foregroundColor(iconColor)
            Text(text)
                .foregroundColor(.gray)
        }
        .font(.system(size: 14))
    }
}

struct OverviewContent: View {
    let project: DIYProject
    let sageGreen: Color
    let sandColor: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            // About
            VStack(alignment: .leading, spacing: 16) {
                Text("About this project")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black.opacity(0.8))
                
                Text(project.description)
                    .foregroundColor(.gray)
            }
            
            // Difficulty
            VStack(alignment: .leading, spacing: 16) {
                Text("Difficulty")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black.opacity(0.8))
                
                HStack(spacing: 4) {
                    ForEach(0..<3, id: \.self) { index in
                        Image(systemName: "star.fill")
                            .foregroundColor(index < 2 ? sandColor : Color.gray.opacity(0.3))
                    }
                    Text("Intermediate")
                        .foregroundColor(.gray)
                }
            }
            
            // Requirements
            VStack(alignment: .leading, spacing: 16) {
                Text("Requirements")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black.opacity(0.8))
                
                HStack(spacing: 24) {
                    StatBadge(icon: "clock", text: "6 hours", iconColor: sageGreen)
                    StatBadge(icon: "wrench", text: "\(project.tools.count) tools", iconColor: sageGreen)
                    StatBadge(icon: "cube.box", text: "\(project.materials.count) materials", iconColor: sageGreen)
                }
            }
        }
    }
}

struct MaterialsContent: View {
    let project: DIYProject
    let sageGreen: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            // Materials Section
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text("Materials Needed")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.black.opacity(0.8))
                    Spacer()
                    Text("\(project.materials.count) items")
                        .foregroundColor(.gray)
                }
                
                ForEach(project.materials, id: \.self) { material in
                    HStack {
                        Text(material)
                            .foregroundColor(.black.opacity(0.8))
                        Spacer()
                        Image(systemName: "cart")
                            .foregroundColor(sageGreen)
                    }
                    .padding(.vertical, 8)
                    Divider()
                }
            }
            
            // Tools Section
            VStack(alignment: .leading, spacing: 16) {
                Text("Tools Required")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black.opacity(0.8))
                
                ForEach(project.tools, id: \.self) { tool in
                    HStack {
                        Text(tool)
                            .foregroundColor(.black.opacity(0.8))
                        Spacer()
                        if tool.contains("Power") {
                            Text("Power Tool")
                                .font(.caption)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(sageGreen.opacity(0.1))
                                .foregroundColor(sageGreen)
                                .cornerRadius(4)
                        }
                    }
                    .padding(.vertical, 8)
                    Divider()
                }
            }
        }
    }
}

struct InstructionsContent: View {
    let project: DIYProject
    let sageGreen: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            if project.isPremium {
                VStack(spacing: 16) {
                    Image(systemName: "lock.fill")
                        .font(.system(size: 48))
                        .foregroundColor(sageGreen)
                    
                    Text("Purchase this project to view instructions")
                        .font(.headline)
                        .foregroundColor(.black.opacity(0.8))
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
            } else {
                Text("Instructions will be available here")
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
            }
        }
    }
}

struct CommentsContent: View {
    let project: DIYProject
    let sageGreen: Color
    let sandColor: Color
    @State private var newComment = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Comment Input
            HStack {
                TextField("Add a comment...", text: $newComment)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Post") {
                    // Post comment action
                }
                .foregroundColor(sageGreen)
                .disabled(newComment.isEmpty)
            }
            
            // Sample Comments
            ForEach(0..<3, id: \.self) { index in
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Circle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 32, height: 32)
                        
                        VStack(alignment: .leading) {
                            Text("User Name")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundColor(.black.opacity(0.8))
                            Text("2 days ago")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Text("Great project! The instructions were very clear and easy to follow.")
                        .font(.subheadline)
                        .foregroundColor(.black.opacity(0.8))
                    
                    HStack {
                        Button(action: {}) {
                            Label("12", systemImage: "heart")
                                .foregroundColor(sandColor)
                        }
                        Button(action: {}) {
                            Label("Reply", systemImage: "arrowshape.turn.up.left")
                                .foregroundColor(sageGreen)
                        }
                    }
                    .font(.caption)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(sageGreen.opacity(0.1), lineWidth: 1)
                )
                .shadow(color: Color.black.opacity(0.03), radius: 10, x: 0, y: 5)
            }
        }
    }
}

struct ProjectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // Original projects
            NavigationView {
                ProjectDetailView(
                    project: DIYProject(
                        title: "Modern Coffee Table",
                        description: "Build a sleek, modern coffee table perfect for any living room",
                        category: .woodworking,
                        difficulty: .intermediate,
                        estimatedTime: 3600 * 6,
                        materials: ["Wood", "Screws", "Wood Finish"],
                        tools: ["Saw", "Drill", "Sandpaper"],
                        thumbnailURL: "coffee_table",
                        isPremium: true,
                        price: 14.99,
                        rating: 4.8,
                        completions: 127
                    )
                )
            }
            
            // LVP Flooring Installation
            NavigationView {
                ProjectDetailView(
                    project: DIYProject(
                        title: "Installing LVP Flooring",
                        description: "Learn how to install luxury vinyl plank flooring like a pro. This guide covers subfloor preparation, layout planning, and proper installation techniques.",
                        category: .homeImprovement,
                        difficulty: .intermediate,
                        estimatedTime: 3600 * 12, // 12 hours for average room
                        materials: ["LVP Planks", "Underlayment", "Spacers", "Transition Strips", "Baseboards"],
                        tools: ["Utility Knife", "Rubber Mallet", "Measuring Tape", "Level", "Tapping Block", "Pull Bar"],
                        thumbnailURL: "lvp_flooring",
                        isPremium: true,
                        price: 19.99,
                        rating: 4.9,
                        completions: 342
                    )
                )
            }
            
            // Picture Hanging Guide
            NavigationView {
                ProjectDetailView(
                    project: DIYProject(
                        title: "Pro Picture Hanging Tips",
                        description: "Master the art of hanging pictures perfectly every time. Learn proper spacing, height calculations, and how to handle different wall materials.",
                        category: .homeImprovement,
                        difficulty: .beginner,
                        estimatedTime: 3600 * 2, // 2 hours
                        materials: ["Picture Hooks", "Wall Anchors", "Picture Wire", "Level Strips"],
                        tools: ["Level", "Hammer", "Drill", "Stud Finder", "Measuring Tape", "Pencil"],
                        thumbnailURL: "picture_hanging",
                        isPremium: false,
                        price: nil,
                        rating: 4.7,
                        completions: 567
                    )
                )
            }
            
            // Trim Installation
            NavigationView {
                ProjectDetailView(
                    project: DIYProject(
                        title: "Mastering Tricky Trim Angles",
                        description: "Learn advanced techniques for installing trim around difficult corners and angles. Perfect for crown molding, baseboards, and door casings.",
                        category: .homeImprovement,
                        difficulty: .advanced,
                        estimatedTime: 3600 * 8, // 8 hours
                        materials: ["Trim Pieces", "Wood Filler", "Caulk", "Nails", "Paint"],
                        tools: ["Miter Saw", "Coping Saw", "Nail Gun", "Angle Finder", "Level"],
                        thumbnailURL: "trim_angles",
                        isPremium: true,
                        price: 24.99,
                        rating: 4.8,
                        completions: 189
                    )
                )
            }
            
            // Floating Shelves
            NavigationView {
                ProjectDetailView(
                    project: DIYProject(
                        title: "Modern Floating Shelves",
                        description: "Build and install sleek floating shelves that appear to float seamlessly on your wall. Includes hidden bracket system and proper wall mounting.",
                        category: .woodworking,
                        difficulty: .intermediate,
                        estimatedTime: 3600 * 4, // 4 hours
                        materials: ["Hardwood Boards", "Floating Shelf Hardware", "Wall Anchors", "Wood Finish"],
                        tools: ["Table Saw", "Drill", "Level", "Stud Finder", "Clamps"],
                        thumbnailURL: "floating_shelves",
                        isPremium: true,
                        price: 16.99,
                        rating: 4.6,
                        completions: 278
                    )
                )
            }
            
            // Original Herb Garden project
            NavigationView {
                ProjectDetailView(
                    project: DIYProject(
                        title: "Herb Garden Planter",
                        description: "Create a beautiful planter box for your herbs",
                        category: .gardening,
                        difficulty: .beginner,
                        estimatedTime: 3600 * 3,
                        materials: ["Cedar Wood", "Soil", "Herbs"],
                        tools: ["Saw", "Drill", "Measuring Tape"],
                        thumbnailURL: "herb_garden",
                        isPremium: false,
                        price: nil,
                        rating: 4.5,
                        completions: 89
                    )
                )
            }
        }
    }
} 