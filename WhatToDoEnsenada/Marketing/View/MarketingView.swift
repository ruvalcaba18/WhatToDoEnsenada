import SwiftUI

struct MarketingView: View {
    var body: some View {
            ScrollView {
                VStack(spacing: 20) {
                    Text("MARKETING")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    // Aquí irían los contenidos de marketing
                    // Anuncios, promociones, etc.
                }
                .padding()
            }
        }
}

#Preview {
    MarketingView()
}
