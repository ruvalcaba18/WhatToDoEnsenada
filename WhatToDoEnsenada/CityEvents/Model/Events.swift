import Foundation

struct Event: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let date: Date
    let location: String
    let price: String
    let imageURL: String?
}
