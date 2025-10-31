import Foundation
final class NewsDirector {
    private let builder: NewsBuildableProtocol

    init(builder: NewsBuildableProtocol) {
        self.builder = builder
    }

    /// Crea una noticia de última hora (Breaking News)
    func constructBreakingNews() -> NewsArticle {
        return builder
            .setTitle("🚨 Incidente Grave en Zona Centro")
            .setSummary("Autoridades reportan un fuerte incidente en el área metropolitana.")
            .setContent("""
                Un grave incidente ocurrió esta mañana en la zona centro. \
                Equipos de emergencia trabajan en el lugar para atender a los afectados.
                """)
            .setCategory(.local)
            .setSensitive(true)
            .setAgeRestricted(true)
            .setSource("RAW Breaking")
            .setLocation("Zona Centro")
            .setBreaking(true)
            .setSeverity("Alta")
            .setInvestigationStatus("En curso")
            .build()
    }

    /// Crea una noticia política
    func constructPoliticalNews() -> NewsArticle {
        return builder
            .setTitle("Nuevas Revelaciones en Caso de Corrupción")
            .setSummary("Filtraciones muestran pruebas contundentes sobre sobornos a funcionarios.")
            .setContent("""
                Documentos internos obtenidos por RAW News muestran nuevas pruebas \
                que implican a varios funcionarios en actos de corrupción.
                """)
            .setCategory(.politics)
            .setSensitive(false)
            .setAgeRestricted(true)
            .setSource("RAW Político")
            .setSeverity("Moderada")
            .setInvestigationStatus("Bajo investigación")
            .build()
    }

    /// Crea una noticia criminal personalizada
    func constructCustomCrimeNews(
        title: String,
        location: String,
        severity: String,
        casualties: Int
    ) -> NewsArticle {
        let content = """
        En \(location), autoridades confirmaron un incidente con \(casualties) víctimas. \
        La investigación sigue en curso y se espera más información.
        """

        return builder
            .setTitle(title)
            .setSummary("Se reportan \(casualties) víctimas en \(location).")
            .setContent(content)
            .setCategory(.crime)
            .setSensitive(true)
            .setAgeRestricted(true)
            .setSource("RAW Crimen")
            .setLocation(location)
            .setBreaking(true)
            .setSeverity(severity)
            .setInvestigationStatus("Activa")
            .build()
    }
}
