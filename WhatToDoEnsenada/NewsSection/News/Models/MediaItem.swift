import Foundation

enum MediaType: String, Codable {
    case image
    case video
    case audio
    case document
}

public struct MediaItem: Codable, Hashable {
    let url: URL
    let type: MediaType
    let description: String?
}
