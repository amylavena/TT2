import Foundation

extension Coach {
    static let sampleCoaches: [Coach] = [
        // Paul (Woodworking Expert)
        .paulSample,
        
        // Mike (Organization & Storage Expert)
        Coach(
            id: "2",
            name: "Mike Thompson",
            category: .homeImprovement,
            rating: 4.9,
            reviewCount: 156,
            hourlyRate: 65,
            expertise: ["Custom Storage", "Closet Design", "Garage Organization", "Space Planning"],
            projectTypes: ["Closet Systems", "Pantry Design", "Garage Storage", "Home Office Setup"],
            interests: ["Maximizing Space", "Sustainable Storage", "Decluttering"],
            skills: ["Space Planning", "Storage Design", "Custom Shelving", "Tool Organization", "Decluttering", "IKEA Hacks"],
            description: """
                Hey there! I'm Mike, and I'm passionate about helping people transform cluttered spaces into organized, functional areas that bring joy to everyday life.

                After 15 years of designing and building custom storage solutions, I've learned that good organization isn't just about buying containers - it's about creating systems that work with your lifestyle. Whether you're dealing with a chaotic garage, an overflowing closet, or a pantry that's lost its way, I can help you design and build practical storage solutions that last.

                I specialize in teaching DIYers how to plan, build, and install their own custom storage systems. From simple floating shelves to complete garage makeovers, I'll guide you through the entire process - measuring, designing, selecting materials, and building. And yes, I'll even help you tackle those tricky IKEA hacks!

                Let's create some order in your space together! 🏠✨
                """,
            imageURL: "mike_thompson",
            reviews: [
                Review(
                    id: "1",
                    authorName: "John D.",
                    date: Date(),
                    rating: 5,
                    comment: "Mike transformed my garage from a disaster zone into an organized dream space. He taught me how to build custom shelving and even showed me how to create a simple workbench. His systematic approach made the whole project feel manageable.",
                    isVerified: true
                ),
                Review(
                    id: "2",
                    authorName: "Sarah P.",
                    date: Date(),
                    rating: 5,
                    comment: "I needed help maximizing space in my tiny pantry, and Mike was amazing! He helped me design a custom solution that doubled my storage space, and walked me through the whole building process. His tips for organizing tools and materials during the build were invaluable.",
                    isVerified: true
                )
            ],
            rates: [
                Rate(
                    id: "1",
                    type: .virtual,
                    title: "Space Planning Session",
                    price: 65,
                    duration: 60,
                    description: "Virtual consultation to assess your space and create an organization plan",
                    additionalInfo: [
                        "Space assessment",
                        "Custom design sketches",
                        "Material recommendations",
                        "Budget planning"
                    ],
                    isPackage: false
                ),
                Rate(
                    id: "2",
                    type: .onsite,
                    title: "Hands-On Building Workshop",
                    price: 299,
                    duration: 240,
                    description: "Learn to build and install your custom storage solutions",
                    additionalInfo: [
                        "Tools and materials list",
                        "Safety guidelines",
                        "Step-by-step instruction",
                        "Installation techniques",
                        "Includes two 2-hour sessions"
                    ],
                    isPackage: true
                )
            ],
            projectPhotos: ["mike_project_1", "mike_project_2", "mike_project_3"],
            instagramPhotos: ["mike_insta_1", "mike_insta_2", "mike_insta_3"],
            profileImage: "mike_thompson"
        ),
        
        // Sue (Ceramics Expert)
        Coach(
            id: "3",
            name: "Sue Walls",
            category: .crafts,
            rating: 4.8,
            reviewCount: 98,
            hourlyRate: 45,
            expertise: ["Ceramics", "Pottery", "Sculpture", "Hand Building"],
            projectTypes: ["Hand Building", "Wheel Throwing", "Glazing", "Decorative Arts"],
            interests: ["Teaching Beginners", "Traditional Methods", "Functional Pottery"],
            skills: ["Pottery wheel", "Hand building", "Glazing", "Kiln firing", "Clay preparation"],
            description: """
                Hello there! I'm Sue, and I've been blessed to work with clay for over 40 years now. 
                
                I keep my classes small and relaxed in my home studio, where I have all my wheels and kilns set up. Due to the nature of pottery equipment, I can only offer sessions here in my Buda studio - but I promise you'll feel right at home! Whether you've never touched clay before or you're looking to refine your techniques, I'd love to share what I've learned over the years.
                
                And don't worry about making mistakes - goodness knows I've made plenty! Those "happy accidents" often turn into our favorite pieces. 🌸
                
                Let's make something wonderful together!
                """,
            imageURL: "sue_profile",
            reviews: [
                Review(
                    id: "1",
                    authorName: "Emily R.",
                    date: Date(),
                    rating: 5,
                    comment: "Sue is like the sweet, encouraging grandmother I never had! Her decades of experience really show in how she teaches. She helped me feel completely at ease, even when I was struggling with centering the clay. She even made us tea and cookies for our break!",
                    isVerified: true
                ),
                Review(
                    id: "2",
                    authorName: "Mark L.",
                    date: Date(),
                    rating: 5,
                    comment: "What a joy to learn from Sue! She has such a wealth of knowledge and shares it so warmly. When I got frustrated with a piece, she told me stories about her own early struggles and helped me see it as part of the learning process. Her studio feels like a second home now.",
                    isVerified: true
                )
            ],
            rates: [
                Rate(
                    id: "1",
                    type: .onsite,
                    title: "Beginner's Clay Journey",
                    price: 45,
                    duration: 120,
                    description: "A gentle introduction to the joy of working with clay at my home studio in Buda. Perfect for first-timers!",
                    additionalInfo: [
                        "All materials provided",
                        "Small class size (max 4)",
                        "Tea and cookies included",
                        "Take home your finished piece",
                        "Sessions at my Buda studio only"
                    ],
                    isPackage: false
                ),
                Rate(
                    id: "2",
                    type: .onsite,
                    title: "Pottery Basics Bundle",
                    price: 299,
                    duration: 480,
                    description: "Four relaxed sessions at my home studio to discover the fundamentals of pottery making",
                    additionalInfo: [
                        "Weekly 2-hour classes",
                        "All materials included",
                        "Glazing and firing",
                        "Plenty of practice time",
                        "Small group setting",
                        "Sessions at my Buda studio only"
                    ],
                    isPackage: true
                )
            ],
            projectPhotos: ["sue_project_1", "sue_project_2", "sue_project_3"],
            instagramPhotos: ["sue_insta_1", "sue_insta_2", "sue_insta_3"],
            profileImage: "sue_profile"
        ),
        
        // Additional Woodworking Coaches
        Coach(
            id: "4",
            name: "Lorraine Jones",
            category: .crafts,
            rating: 4.9,
            reviewCount: 134,
            hourlyRate: 70,
            expertise: ["Home Brewing", "Beer Recipe Development", "Equipment Setup", "Fermentation Control"],
            projectTypes: ["Starter Brewing Kits", "All-Grain Brewing", "Recipe Formulation", "Equipment Upgrades"],
            interests: ["Craft Beer", "Local Ingredients", "Sustainable Brewing", "Beer Education"],
            skills: [
                "Equipment sanitization",
                "Mashing techniques",
                "Hop selection",
                "Yeast management",
                "Recipe formulation",
                "Temperature control",
                "Bottling process",
                "Draft systems"
            ],
            description: """
                Hey there, beer enthusiasts! 🍺

                I'm Lorraine, and I've been obsessed with crafting the perfect brew for over a decade. What started as a curious experiment in my garage has turned into an amazing journey of teaching others how to make incredible beer at home.

                Look, I get it - home brewing can seem intimidating at first. All those terms like "mashing," "specific gravity," and "hop schedules" might sound like a foreign language. But here's the thing: I was once in your shoes, and I've made pretty much every brewing mistake possible (ask me about my exploding bottle story sometime 😅).

                That's exactly why I love teaching! Whether you're just starting with extract brewing or ready to dive into all-grain, I'll break everything down into simple, manageable steps. No brewing question is too basic - seriously, I want to hear them all!

                Ready to start your brewing adventure? Let's make some awesome beer together! 🌟
                """,
            imageURL: "lorraine_jones",
            reviews: [
                Review(
                    id: "1",
                    authorName: "Rachel K.",
                    date: Date(),
                    rating: 5,
                    comment: "Lorraine is seriously the coolest brewing coach ever! I was super nervous about messing up my first batch, but she made the whole process fun and totally stress-free. She has this way of explaining things that just clicks - plus she shares some hilarious brewing fail stories that make you feel way better about being a beginner. My first pale ale turned out amazing!",
                    isVerified: true
                ),
                Review(
                    id: "2",
                    authorName: "James M.",
                    date: Date(),
                    rating: 5,
                    comment: "If you want to learn brewing from someone who really knows their stuff but doesn't make you feel dumb for asking questions, Lorraine's your person. She helped me level up from extract to all-grain brewing with zero pressure. She's got this infectious enthusiasm that makes you excited about every part of the process - even cleaning and sanitizing! Plus, she knows all the best tips for avoiding common mistakes.",
                    isVerified: true
                )
            ],
            rates: [
                Rate(
                    id: "1",
                    type: .onsite,
                    title: "Brew Day Basics",
                    price: 85,
                    duration: 120,
                    description: "Let's get you brewing! Hands-on intro to making your first amazing batch",
                    additionalInfo: [
                        "All equipment provided",
                        "Beginner-friendly process",
                        "Take home your own recipe",
                        "Lifetime brewing support"
                    ],
                    isPackage: false
                ),
                Rate(
                    id: "2",
                    type: .onsite,
                    title: "Level-Up Brewing Package",
                    price: 399,
                    duration: 480,
                    description: "Ready to go pro? Four sessions to master all-grain brewing and create your signature recipes 🏆",
                    additionalInfo: [
                        "Advanced brewing techniques",
                        "Custom recipe development",
                        "Water chemistry made simple",
                        "Equipment setup guidance",
                        "Includes a full brew day together"
                    ],
                    isPackage: true
                )
            ],
            projectPhotos: ["lorraine_project_1", "lorraine_project_2", "lorraine_project_3"],
            instagramPhotos: ["lorraine_insta_1", "lorraine_insta_2", "lorraine_insta_3"],
            profileImage: "lorraine_jones"
        ),
        
        // Additional Pottery/Crafts Coach
        Coach(
            id: "5",
            name: "David Chen",
            category: .crafts,
            rating: 4.9,
            reviewCount: 112,
            hourlyRate: 55,
            expertise: ["Ceramics", "Glaze Chemistry", "Raku Firing"],
            projectTypes: ["Functional Pottery", "Raku", "Custom Glazes"],
            interests: ["Japanese Ceramics", "Glaze Development", "Teaching"],
            skills: ["Wheel throwing", "Glaze mixing", "Raku firing", "Hand building", "Kiln operation"],
            description: """
                David specializes in Japanese pottery techniques and custom glaze development.
                
                With an emphasis on the science behind ceramics, he helps students understand both the artistic and technical aspects of pottery.
                """,
            imageURL: "david_profile",
            reviews: [
                Review(
                    id: "1",
                    authorName: "Sarah M.",
                    date: Date(),
                    rating: 5,
                    comment: "David's knowledge of glazes is incredible. He helped me develop a unique glaze for my work and taught me the science behind why certain combinations work.",
                    isVerified: true
                ),
                Review(
                    id: "2",
                    authorName: "Tom H.",
                    date: Date(),
                    rating: 4,
                    comment: "The Raku workshop was amazing! David's expertise made the complex firing process understandable and exciting.",
                    isVerified: true
                )
            ],
            rates: [
                Rate(
                    id: "1",
                    type: .onsite,
                    title: "Glaze Development Workshop",
                    price: 95,
                    duration: 180,
                    description: "Learn to create and test your own glazes",
                    additionalInfo: ["Materials provided", "Take home test tiles", "Recipe book included"],
                    isPackage: false
                ),
                Rate(
                    id: "2",
                    type: .onsite,
                    title: "Raku Firing Experience",
                    price: 250,
                    duration: 360,
                    description: "Full-day Raku workshop including firing",
                    additionalInfo: [
                        "All materials included",
                        "Safety equipment provided",
                        "Take home 2-3 pieces",
                        "Lunch included"
                    ],
                    isPackage: true
                )
            ],
            projectPhotos: ["david_project_1", "david_project_2", "david_project_3"],
            instagramPhotos: ["david_insta_1", "david_insta_2", "david_insta_3"],
            profileImage: "david_profile"
        ),
        
        // Additional Electrical/Smart Home Coach
        Coach(
            id: "6",
            name: "Alex Rivera",
            category: .electrical,
            rating: 4.8,
            reviewCount: 143,
            hourlyRate: 75,
            expertise: ["Home Automation", "Solar Installation", "Energy Efficiency"],
            projectTypes: ["Smart Home", "Solar Power", "Energy Monitoring"],
            interests: ["Renewable Energy", "Smart Technology", "Energy Conservation"],
            skills: ["Solar installation", "Smart home integration", "Energy monitoring", "Automation programming"],
            description: """
                Alex specializes in renewable energy solutions and advanced home automation.
                
                Combining electrical expertise with sustainable technology, he helps homeowners create efficient, modern living spaces.
                """,
            imageURL: "alex_profile",
            reviews: [
                Review(
                    id: "1",
                    authorName: "Michael P.",
                    date: Date(),
                    rating: 5,
                    comment: "Alex helped me plan and install a complete smart home system. His knowledge of both electrical work and home automation made the project seamless.",
                    isVerified: true
                ),
                Review(
                    id: "2",
                    authorName: "Linda R.",
                    date: Date(),
                    rating: 5,
                    comment: "The solar consultation was eye-opening. Alex explained everything clearly and helped me design an efficient system for my home.",
                    isVerified: true
                )
            ],
            rates: [
                Rate(
                    id: "1",
                    type: .virtual,
                    title: "Smart Home Consultation",
                    price: 85,
                    duration: 60,
                    description: "Plan your smart home setup",
                    additionalInfo: ["System design", "Product recommendations", "Integration planning"],
                    isPackage: false
                ),
                Rate(
                    id: "2",
                    type: .onsite,
                    title: "Solar Energy Package",
                    price: 499,
                    duration: 480,
                    description: "Complete solar system planning and basic installation guidance",
                    additionalInfo: [
                        "Site assessment",
                        "System design",
                        "Installation planning",
                        "Efficiency optimization",
                        "Rebate guidance"
                    ],
                    isPackage: true
                )
            ],
            projectPhotos: ["alex_project_1", "alex_project_2", "alex_project_3"],
            instagramPhotos: ["alex_insta_1", "alex_insta_2", "alex_insta_3"],
            profileImage: "alex_profile"
        )
    ]
} 
