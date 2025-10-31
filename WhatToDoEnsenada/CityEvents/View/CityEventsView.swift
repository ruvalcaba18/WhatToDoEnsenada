import SwiftUI

struct CityEventsView {
    @State private var events: [Event] = []
}

extension CityEventsView: View {
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(events) { event in
                    EventCardView(event: event)
                }
            }
            .padding()
        }
        .onAppear {
            loadEvents()
        }
    }
    
    private func loadEvents() {
        events = [
            Event(
                title: "Concierto Underground",
                description: "Bandas locales en vivo",
                date: Date().addingTimeInterval(86400),
                location: "Sala Roxy",
                price: "$15",
                imageURL: nil
            )
        ]
    }
}

#Preview {
    CityEventsView()
}
