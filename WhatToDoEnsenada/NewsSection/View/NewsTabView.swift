import SwiftUI

struct NewsTabView {
    @State private var selectedCategory: NewsCategory = .crime
    @StateObject private var viewModel = NewsSectionViewModel()
}

extension NewsTabView: View {
    
    var body: some View {
        VStack(spacing: 0) {
            // Selector de categorías
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(NewsCategory.allCases, id: \.self) { category in
                        CategoryChip(
                            category: category,
                            isSelected: selectedCategory == category
                        ) {
                            selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal)
            }
            .padding(.vertical, 8)
            
            // Lista de noticias
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.articles) { article in
                        NewsCard(article: article)
                    }
                }
                .padding()
            }
        }
        .onAppear {
            viewModel.loadArticles()
        }
    }
    
  
}

#Preview {
    NewsTabView()
}
