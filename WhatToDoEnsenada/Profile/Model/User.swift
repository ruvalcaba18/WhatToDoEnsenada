import Foundation

struct User: Codable, Identifiable {
    let id: String
    let email: String
    let name: String
    let profile: UserProfile
    var authToken: String?
}

struct UserProfile: Codable {
    let age: Int
    var preferences: [String]
    var verified: Bool = false

    
    private enum CodingKeys: String, CodingKey {
        case age, preferences, verified
    }
}
