import Foundation

struct SearchUtils {
    static func searchCoaches(_ coaches: [Coach], searchTerm: String) -> [Coach] {
        guard !searchTerm.isEmpty else { return coaches }
        
        let searchTermLower = searchTerm.lowercased()
        
        return coaches.filter { coach in
            // Check expertise
            if coach.expertise.contains(where: { 
                $0.lowercased().contains(searchTermLower) 
            }) {
                return true
            }
            
            // Check projectTypes
            if coach.projectTypes.contains(where: { 
                $0.lowercased().contains(searchTermLower) 
            }) {
                return true
            }
            
            // Check skills
            if coach.skills.contains(where: { 
                $0.lowercased().contains(searchTermLower) 
            }) {
                return true
            }
            
            // Check interests
            if coach.interests.contains(where: { 
                $0.lowercased().contains(searchTermLower)
            }) {
                return true
            }
            
            // Check description
            if let description = coach.description?.lowercased(),
               description.contains(searchTermLower) {
                return true
            }
            
            return false
        }
    }
} 