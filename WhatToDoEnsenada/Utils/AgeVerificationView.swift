import SwiftUI

struct AgeVerificationView {
    @Binding var isVerified: Bool
    @State private var birthDate = Date()
    @State private var showError = false
    
    private var isAdult: Bool {
        let calendar = Calendar.current
        let age = calendar.dateComponents([.year], from: birthDate, to: Date()).year ?? 0
        return age >= 18
    }
}

extension AgeVerificationView: View {
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            VStack(spacing: 20) {
                Image(systemName: "eye.trianglebadge.exclamationmark")
                    .font(.system(size: 60))
                    .foregroundColor(.red)
                
                Text("CONTENIDO EXPLÍCITO")
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                
                Text("Esta aplicación contiene material gráfico y noticias sin censura. Debes ser mayor de 18 años para continuar.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("FECHA DE NACIMIENTO")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                
                DatePicker("Selecciona tu fecha de nacimiento",
                          selection: $birthDate,
                          in: ...Date(),
                          displayedComponents: .date)
                    .datePickerStyle(.wheel)
                    .labelsHidden()
            }
            .padding(.horizontal)
            
            if showError {
                Text("Debes ser mayor de 18 años para acceder")
                    .foregroundColor(.red)
                    .font(.caption)
            }
            
            Button("VERIFICAR EDAD") {
                if isAdult {
                    UserDefaults.standard.set(true, forKey: "ageVerified")
                    isVerified = false
                } else {
                    showError = true
                }
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.red)
            .cornerRadius(12)
            .padding(.horizontal)
            
            Spacer()
        }
        .background(Color(.systemBackground))
    }
}

#Preview {
    AgeVerificationView(
        isVerified: .constant(true)
    )
}
