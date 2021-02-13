import Foundation

struct Pairs: Codable {
    let result: [Pair]
}

struct Pair: Codable {
    let id: Int
    let symbol: String
    let base: Currency
    let quote: Currency
    let route: String
}

struct Currency: Codable {
    let id: Int
    let symbol: String
    let name: String
    let fiat: Bool
    let route: String
}
