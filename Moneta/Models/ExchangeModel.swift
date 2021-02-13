import Foundation

struct Exchanges: Codable {
    let result: [Exchange]
}

struct Exchange: Codable {
    let id: Int
    let symbol: String
    let name: String
    let route: String
    let active: Bool
}
