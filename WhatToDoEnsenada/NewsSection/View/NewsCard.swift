import SwiftUI

struct NewsCard {
    let article: NewsArticle
}

extension NewsCard: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Header de la tarjeta
            HStack {
                if article.metadata.isSensitive {
                    Label("EXPLÍCITO", systemImage: "eye.trianglebadge.exclamationmark")
                        .font(.system(size: 10, weight: .black))
                        .foregroundColor(.red)
                }
                
                Text(article.category?.rawValue ?? "" )
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Text(article.publishedAt, style: .relative)
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
            }
            
            // Contenido
            VStack(alignment: .leading, spacing: 8) {
                Text(article.title)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.primary)
                
                Text(article.content)
                    .font(.system(size: 14))
                    .foregroundColor(.primary)
                    .lineLimit(3)
            }
            
            // Footer
            HStack {
                Text(article.source)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Button("Leer más") {
                    // Navegar a detalle
                }
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.red)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}
#Preview {
    NewsCard(article: .init(title: "", content: "", source: ""))
}
