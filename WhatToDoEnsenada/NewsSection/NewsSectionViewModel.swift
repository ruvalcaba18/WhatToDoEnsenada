import Foundation

final class NewsSectionViewModel: ObservableObject {
    
    @Published private(set) var articles: [NewsArticle] = []
    
    public init() {
        
    }
    
    public func loadArticles() {
        // Simular carga de datos
        articles = [
            NewsArticle(
                title: "Incidente grave en zona industrial",
                content: "Detalles explícitos del incidente...",
                category: .local,
                source: "RAW News",
                publishedAt: Date(),
                imageURL: nil,
                metadata: .init(isSensitive: true, ageRestricted: true, location: "", isBreaking: true, severity: "", investigationStatus: "")
            ),
            NewsArticle(
                title: "Investigación revela corrupción en municipio",
                content: "Documentos confidenciales obtenidos..",
                category: .investigations,
                source: "RAW Investigaciones",
                publishedAt: Date().addingTimeInterval(-3600),
                imageURL: nil,
                metadata: .init(isSensitive: false, ageRestricted: false, location: "", isBreaking: true, severity: "", investigationStatus: "")
            )
        ]
    }
    
}

