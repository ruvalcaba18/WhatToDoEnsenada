import SwiftUI
import SwiftData

struct ContentView {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State private var selectedTab: AppTab = .news
    @State private var showAgeVerification = !UserDefaults.standard.bool(forKey: "ageVerified")
    
}

extension ContentView: View {
    
    var body: some View {
        ZStack {
            if showAgeVerification {
                AgeVerificationView(isVerified: $showAgeVerification)
            } else {
                mainInterface
            }
        }
    }
    
    private var navigationSplitView: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }
    
    
    private var mainInterface: some View {
        VStack(spacing: 0) {
            // Header personalizado
            CustomHeaderView(selectedTab: $selectedTab)
            
            // Contenido de los tabs
            TabView(selection: $selectedTab) {
                NewsTabView()
                    .tag(AppTab.news)
                
                CityEventsView()
                    .tag(AppTab.events)
                
                MarketingView()
                    .tag(AppTab.marketing)
                
                ProfileView()
                    .tag(AppTab.profile)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
        .ignoresSafeArea(.container, edges: .bottom)
    }
    
    
}

extension ContentView {
    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
