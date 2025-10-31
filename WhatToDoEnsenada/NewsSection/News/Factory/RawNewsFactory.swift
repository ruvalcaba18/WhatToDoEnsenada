
import Foundation

public class RawNewsFactory: NewsFactoryProtocol {
    
    public init() {}
    
    public func createNewsArticle(
        title: String,
        content: String,
        category: NewsCategory,
        imageURL: String? = nil,
        isSensitive: Bool = false,
        publishedAt: Date = Date(),
        source: String = "RAW News"
    ) -> NewsArticle {
        
        let metadata = ArticleMetadata(
            isSensitive: isSensitive,
            ageRestricted: isSensitive,
            location: nil,
            isBreaking: false,
            severity: nil,
            investigationStatus: nil
        )
        
        return NewsArticle(
            title: title,
            content: content,
            category: category,
            source: source,
            publishedAt: publishedAt,
            imageURL: imageURL,
            media: [],
            metadata: metadata
        )
    }
    
    public func createBreakingNews(
        title: String,
        content: String,
        location: String,
        severity: NewsSeverity
    ) -> NewsArticle {
        
        let metadata = ArticleMetadata(
            isSensitive: true,
            ageRestricted: true,
            location: location,
            isBreaking: true,
            severity: severity.rawValue,
            investigationStatus: "Urgente"
        )
        
        return NewsArticle(
            title: "🚨 \(title)",
            summary: "Noticia de último momento",
            content: content,
            category: .crime,
            tags: ["breaking", "alerta"],
            author: "Equipo RAW News",
            source: "RAW Breaking News",
            publishedAt: Date(),
            imageURL: nil,
            media: [],
            metadata: metadata
        )
    }
    
    public func createInvestigativeNews(
        title: String,
        content: String,
        sources: [String],
        evidence: [String]
    ) -> NewsArticle {
        
        let metadata = ArticleMetadata(
            isSensitive: false,
            ageRestricted: false,
            location: nil,
            isBreaking: false,
            severity: nil,
            investigationStatus: "En investigación"
        )
        
        let media = evidence.compactMap { urlString -> MediaItem? in
            guard let url = URL(string: urlString) else { return nil }
            return MediaItem(url: url, type: .document, description: "Evidencia del caso")
        }
        
        return NewsArticle(
            title: "🔍 \(title)",
            summary: "Informe especial de investigación periodística.",
            content: content,
            category: .investigations,
            tags: sources,
            author: "Unidad de Investigación RAW",
            source: "RAW Investigaciones",
            publishedAt: Date(),
            imageURL: nil,
            media: media,
            metadata: metadata
        )
    }
}
