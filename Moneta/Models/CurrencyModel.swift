import Foundation

struct Currencies: Codable {
    let data: [Currency]
    let status: Status
}

struct Currency: Codable {
    let id: Int
    let name: String
    let sign: String
    let symbol: String
}
