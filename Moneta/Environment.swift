import Foundation

enum Environment {
    static let apiKey: String = {
        guard let apiKey = Bundle.main.infoDictionary!["API_KEY"] as? String else {
            fatalError("api key not found")
        }

        return apiKey
    }()
}
