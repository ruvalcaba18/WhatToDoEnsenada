import Foundation

public enum NewsCategory: String, Codable,CaseIterable {
    case politics = "Política"
    case science = "Ciencia"
    case crime = "Crimen"
    case investigations = "Investigaciones"
    case world = "Mundo"
    case local = "Local"
    case economy = "Economía"
    case technology = "Tecnología"
    case culture = "Cultura"
    case other = "Otros"
    
    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        self = NewsCategory(rawValue: value) ?? .other
    }
}
