
import Foundation
public struct ArticleMetadata: Codable, Hashable {
    let isSensitive: Bool
    let ageRestricted: Bool
    let location: String?
    let isBreaking: Bool
    let severity: String?
    let investigationStatus: String?

    public static let `default` = ArticleMetadata(
        isSensitive: false,
        ageRestricted: false,
        location: nil,
        isBreaking: false,
        severity: nil,
        investigationStatus: nil
    )
}
