import Foundation

protocol NewsBuildableProtocol {
    func setTitle(_ title: String) -> Self
    func setSummary(_ summary: String?) -> Self
    func setContent(_ content: String) -> Self
    func setCategory(_ category: NewsCategory?) -> Self
    func setTags(_ tags: [String]) -> Self
    func setAuthor(_ author: String?) -> Self
    func setSource(_ source: String) -> Self
    func setPublishedAt(_ date: Date) -> Self
    func setImageURL(_ url: String?) -> Self
    func setMedia(_ urls: [String]) -> Self
    func setSensitive(_ isSensitive: Bool) -> Self
    func setAgeRestricted(_ isRestricted: Bool) -> Self
    func setLocation(_ location: String?) -> Self
    func setBreaking(_ isBreaking: Bool) -> Self
    func setSeverity(_ severity: String?) -> Self
    func setInvestigationStatus(_ status: String?) -> Self
    func build() -> NewsArticle
}
