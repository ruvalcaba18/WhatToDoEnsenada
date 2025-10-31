import Foundation

public struct NewsArticle: Identifiable, Hashable, Codable {
    public let id: UUID
    let title: String
    let summary: String?
    let content: String
    let category: NewsCategory?
    let tags: [String]
    let author: String?
    let source: String
    let publishedAt: Date
    let imageURL: String?
    let media: [MediaItem]
    let metadata: ArticleMetadata

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    public static func == (lhs: NewsArticle, rhs: NewsArticle) -> Bool {
        lhs.id == rhs.id
    }

    public init(
        id: UUID = UUID(),
        title: String,
        summary: String? = nil,
        content: String,
        category: NewsCategory? = nil,
        tags: [String] = [],
        author: String? = nil,
        source: String,
        publishedAt: Date = Date(),
        imageURL: String? = nil,
        media: [MediaItem] = [],
        metadata: ArticleMetadata = .default
    ) {
        self.id = id
        self.title = title
        self.summary = summary
        self.content = content
        self.category = category
        self.tags = tags
        self.author = author
        self.source = source
        self.publishedAt = publishedAt
        self.imageURL = imageURL
        self.media = media
        self.metadata = metadata
    }
}


extension NewsArticle {
    static let mockData: [NewsArticle] = [
        NewsArticle(
            title: "Descubren nueva especie de jaguar en la selva mexicana",
            summary: "Investigadores revelan una nueva subespecie con características únicas.",
            content: """
            Un grupo de científicos del Instituto de Biología de la UNAM anunció el hallazgo de una nueva subespecie de jaguar \
            en el sur de México. Este descubrimiento podría tener un gran impacto en la conservación de la fauna local y en \
            la biodiversidad de la región.
            """,
            category: .science,
            tags: ["fauna", "biodiversidad", "México"],
            author: "Laura Méndez",
            source: "NatureMX",
            publishedAt: Date().addingTimeInterval(-3600 * 24),
            imageURL: "https://example.com/images/jaguar.jpg",
            media: [
                MediaItem(
                    url: URL(string: "https://example.com/videos/jaguar-discovery.mp4")!,
                    type: .video,
                    description: "Video del momento del hallazgo"
                )
            ],
            metadata: ArticleMetadata(
                isSensitive: false,
                ageRestricted: false,
                location: "Chiapas, México",
                isBreaking: false,
                severity: nil,
                investigationStatus: "Confirmado"
            )
        ),
        NewsArticle(
            title: "Protestas en la capital por medidas de austeridad",
            summary: "Miles de personas se reunieron en el centro de la ciudad para exigir cambios.",
            content: """
            Las manifestaciones comenzaron de manera pacífica, pero horas después se registraron enfrentamientos con las fuerzas \
            de seguridad. El gobierno anunció una investigación sobre los incidentes.
            """,
            category: .politics,
            tags: ["protesta", "austeridad", "gobierno"],
            author: "Carlos Ortega",
            source: "El Diario Nacional",
            publishedAt: Date().addingTimeInterval(-3600 * 6),
            imageURL: "https://example.com/images/protestas.jpg",
            media: [],
            metadata: ArticleMetadata(
                isSensitive: true,
                ageRestricted: true,
                location: "Ciudad de México",
                isBreaking: false,
                severity: "Moderada",
                investigationStatus: "En investigación"
            )
        ),
        NewsArticle(
            title: "Terremoto de magnitud 6.8 sacude la costa del Pacífico",
            summary: "El sismo se sintió en varios estados y provocó daños menores.",
            content: """
            Un fuerte sismo de magnitud 6.8 se registró la madrugada de este martes frente a las costas del Pacífico. \
            Protección Civil informó que no se reportaron víctimas mortales y que los servicios de emergencia se encuentran \
            monitoreando posibles réplicas.
            """,
            category: .world,
            tags: ["terremoto", "emergencia", "última hora"],
            author: "Agencia Reuters",
            source: "Reuters",
            publishedAt: Date(),
            imageURL: "https://example.com/images/terremoto.jpg",
            media: [],
            metadata: ArticleMetadata(
                isSensitive: false,
                ageRestricted: false,
                location: "Guerrero, México",
                isBreaking: true,
                severity: "Alta",
                investigationStatus: "Monitoreo activo"
            )
        )
    ]
}
