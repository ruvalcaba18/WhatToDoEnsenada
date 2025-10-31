import Foundation
final class NewsArticleBuilder: NewsBuildableProtocol {

    // MARK: - Stored Properties
    private var title: String = ""
    private var summary: String?
    private var content: String = ""
    private var category: NewsCategory?
    private var tags: [String] = []
    private var author: String?
    private var source: String = "RAW News"
    private var publishedAt: Date = Date()
    private var imageURL: String?
    private var media: [MediaItem] = []

    // Metadata
    private var isSensitive: Bool = false
    private var ageRestricted: Bool = false
    private var location: String?
    private var isBreaking: Bool = false
    private var severity: String?
    private var investigationStatus: String?

    // MARK: - Setters

    func setTitle(_ title: String) -> Self {
        self.title = title
        return self
    }

    func setSummary(_ summary: String?) -> Self {
        self.summary = summary
        return self
    }

    func setContent(_ content: String) -> Self {
        self.content = content
        return self
    }

    func setCategory(_ category: NewsCategory?) -> Self {
        self.category = category
        return self
    }

    func setTags(_ tags: [String]) -> Self {
        self.tags = tags
        return self
    }

    func setAuthor(_ author: String?) -> Self {
        self.author = author
        return self
    }

    func setSource(_ source: String) -> Self {
        self.source = source
        return self
    }

    func setPublishedAt(_ date: Date) -> Self {
        self.publishedAt = date
        return self
    }

    func setImageURL(_ url: String?) -> Self {
        self.imageURL = url
        return self
    }

    func setMedia(_ urls: [String]) -> Self {
        self.media = urls.compactMap { urlString in
            guard let url = URL(string: urlString) else { return nil }
            let type = NewsArticleBuilder.inferMediaType(from: urlString)
            return MediaItem(url: url, type: type, description: nil)
        }
        return self
    }

    func setSensitive(_ isSensitive: Bool) -> Self {
        self.isSensitive = isSensitive
        return self
    }

    func setAgeRestricted(_ isRestricted: Bool) -> Self {
        self.ageRestricted = isRestricted
        return self
    }

    func setLocation(_ location: String?) -> Self {
        self.location = location
        return self
    }

    func setBreaking(_ isBreaking: Bool) -> Self {
        self.isBreaking = isBreaking
        return self
    }

    func setSeverity(_ severity: String?) -> Self {
        self.severity = severity
        return self
    }

    func setInvestigationStatus(_ status: String?) -> Self {
        self.investigationStatus = status
        return self
    }

    // MARK: - Build

    func build() -> NewsArticle {
        let metadata = ArticleMetadata(
            isSensitive: isSensitive,
            ageRestricted: ageRestricted,
            location: location,
            isBreaking: isBreaking,
            severity: severity,
            investigationStatus: investigationStatus
        )

        return NewsArticle(
            title: title,
            summary: summary,
            content: content,
            category: category,
            tags: tags,
            author: author,
            source: source,
            publishedAt: publishedAt,
            imageURL: imageURL,
            media: media,
            metadata: metadata
        )
    }

    // MARK: - Helper

    private static func inferMediaType(from urlString: String) -> MediaType {
        let lower = urlString.lowercased()
        if lower.hasSuffix(".jpg") || lower.hasSuffix(".jpeg") || lower.hasSuffix(".png") {
            return .image
        } else if lower.hasSuffix(".mp4") || lower.hasSuffix(".mov") {
            return .video
        } else if lower.hasSuffix(".mp3") || lower.hasSuffix(".wav") {
            return .audio
        } else {
            return .document
        }
    }
}
