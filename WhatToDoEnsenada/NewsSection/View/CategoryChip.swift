import SwiftUI

struct CategoryChip {
    let category: NewsCategory
    let isSelected: Bool
    let action: () -> Void
}

extension CategoryChip: View {
    
    var body: some View {
        Text(category.rawValue)
            .font(.system(size: 14, weight: .semibold))
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(isSelected ? Color.red : Color.gray.opacity(0.2))
            .foregroundColor(isSelected ? .white : .primary)
            .cornerRadius(20)
            .onTapGesture(perform: action)
    }
}

#Preview {
    CategoryChip(category: .crime, isSelected: true, action: {
        
    })
}
