import Foundation

class DIYerHomeViewModel: ObservableObject {
    @Published var recommendedProjects: [DIYProject] = [
        DIYProject(
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
        ),
        DIYProject(
            title: "Herb Garden Planter",
            description: "Create a beautiful herb garden planter for your kitchen",
            category: .gardening,
            difficulty: .beginner,
            estimatedTime: 3600 * 2,
            materials: ["Wood", "Soil", "Seeds"],
            tools: ["Saw", "Drill", "Garden Tools"],
            thumbnailURL: "herb_garden",
            isPremium: false,
            price: nil,
            rating: 4.5,
            completions: 89
        ),
        DIYProject(
            title: "Installing LVP Flooring",
            description: "Learn how to install luxury vinyl plank flooring like a pro. This guide covers subfloor preparation, layout planning, and proper installation techniques.",
            category: .homeImprovement,
            difficulty: .intermediate,
            estimatedTime: 3600 * 12,
            materials: ["LVP Planks", "Underlayment", "Spacers", "Transition Strips", "Baseboards"],
            tools: ["Utility Knife", "Rubber Mallet", "Measuring Tape", "Level", "Tapping Block", "Pull Bar"],
            thumbnailURL: "lvp_flooring",
            isPremium: true,
            price: 19.99,
            rating: 4.9,
            completions: 342
        ),
        DIYProject(
            title: "Pro Picture Hanging Tips",
            description: "Master the art of hanging pictures perfectly every time. Learn proper spacing, height calculations, and how to handle different wall materials.",
            category: .homeImprovement,
            difficulty: .beginner,
            estimatedTime: 3600 * 2,
            materials: ["Picture Hooks", "Wall Anchors", "Picture Wire", "Level Strips"],
            tools: ["Level", "Hammer", "Drill", "Stud Finder", "Measuring Tape", "Pencil"],
            thumbnailURL: "picture_hanging",
            isPremium: false,
            price: nil,
            rating: 4.7,
            completions: 567
        ),
        DIYProject(
            title: "Modern Floating Shelves",
            description: "Build and install sleek floating shelves that appear to float seamlessly on your wall. Includes hidden bracket system and proper wall mounting.",
            category: .woodworking,
            difficulty: .intermediate,
            estimatedTime: 3600 * 4,
            materials: ["Hardwood Boards", "Floating Shelf Hardware", "Wall Anchors", "Wood Finish"],
            tools: ["Table Saw", "Drill", "Level", "Stud Finder", "Clamps"],
            thumbnailURL: "floating_shelves",
            isPremium: true,
            price: 16.99,
            rating: 4.6,
            completions: 278
        )
    ]
}
