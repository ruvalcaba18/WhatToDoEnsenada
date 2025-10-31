import SwiftUI

struct EventCardView {
    let event: Event
}

extension EventCardView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(event.title)
                .font(.system(size: 18, weight: .bold))
            
            Text(event.description)
                .font(.system(size: 14))
                .foregroundColor(.secondary)
            
            HStack {
                Text(event.date.description)
                    .font(.system(size: 12))
                
                Spacer()
                
                Text(event.location)
                    .font(.system(size: 12))
                
                Spacer()
                
                Text(event.price)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.red)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 1)
    }
}



#Preview {
    EventCardView(
        event: .init(
            title: "",
            description: "",
            date: Date(),
            location: "",
            price: "",
            imageURL: ""
        )
    )
}
