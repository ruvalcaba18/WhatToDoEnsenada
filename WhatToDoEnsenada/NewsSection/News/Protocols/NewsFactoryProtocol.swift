
import Foundation

public protocol NewsFactoryProtocol {
    func createNewsArticle(
        title: String,
        content: String,
        category: NewsCategory,
        imageURL: String?,
        isSensitive: Bool,
        publishedAt: Date,
        source: String
    ) -> NewsArticle
    
    func createBreakingNews(
        title: String,
        content: String,
        location: String,
        severity: NewsSeverity
    ) -> NewsArticle
    
    func createInvestigativeNews(
        title: String,
        content: String,
        sources: [String],
        evidence: [String]
    ) -> NewsArticle
}
