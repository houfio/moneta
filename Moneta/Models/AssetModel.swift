import Foundation

struct Assets: Codable {
    let result: [Asset]
}

struct Asset: Codable {
    let id: Int
    let symbol: String
    let name: String
    let fiat: Bool
    let route: String
}
