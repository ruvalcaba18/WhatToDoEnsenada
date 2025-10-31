import SwiftUI

struct CustomHeaderView {
    @Binding var selectedTab: AppTab
    @Namespace private var animation
}

extension CustomHeaderView: View {
    
    var body: some View {
        VStack(spacing: 0) {

            HStack {
                logoImage
                headerTitle
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "bell")
                        .font(.title3)
                }
            }
            .padding(.horizontal)
            .padding(.top, 8)
            
            tabSelector
        }
        .background(.ultraThinMaterial)
    }
    
    private var logoImage: some View {
        Image(systemName: "eye.trianglebadge.exclamationmark")
            .font(.title2)
            .foregroundColor(.red)
    }
    
    private var headerTitle: some View {
        Text("RAW NEWS")
            .font(.title2)
            .fontWeight(.black)
            .foregroundColor(.primary)
    }
    
    private var tabSelector: some View {
        
        HStack(spacing: 0) {
            ForEach(AppTab.allCases, id: \.self) { tab in
                VStack(spacing: 6) {
                    Text(tab.rawValue.uppercased())
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(selectedTab == tab ? .primary : .secondary)
                    
                    if selectedTab == tab {
                        Capsule()
                            .fill(Color.red)
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    } else {
                        Capsule()
                            .fill(Color.clear)
                            .frame(height: 3)
                    }
                }
                .frame(maxWidth: .infinity)
                .onTapGesture {
                    withAnimation(.spring()) {
                        selectedTab = tab
                    }
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 8)
    }
}

#Preview {
    CustomHeaderView(selectedTab: .constant(.marketing))
}
