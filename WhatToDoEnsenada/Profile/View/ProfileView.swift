import SwiftUI

struct ProfileView: View {
    var body: some View {
          ScrollView {
              VStack(spacing: 20) {
                  Text("PERFIL")
                      .font(.title)
                      .fontWeight(.bold)
                  
                  // Configuración de usuario, preferencias, etc.
              }
              .padding()
          }
      }
}

#Preview {
    ProfileView()
}
