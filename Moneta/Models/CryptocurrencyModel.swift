import Foundation

struct Cryptocurrencies: Codable {
    let data: [Cryptocurrency]
    let status: Status
}

struct Cryptocurrency: Codable {
    let id: Int
    let name: String
    let symbol: String
    let slug: String
    let cmcRank: Int
    let numMarketPairs: Int
    let circulatingSupply: Double
    let totalSupply: Double
    let maxSupply: Double?
    let lastUpdated: String
    let dateAdded: String
    let tags: [String]
    let platform: Platform?
    let quote: Dictionary<String, Quote>
}

struct Platform: Codable {
    let id: Int
    let name: String
    let symbol: String
    let slug: String
    let tokenAddress: String
}

struct Quote: Codable {
    let price: Double
    let volume24H: Double
    let percentChange1H: Double
    let percentChange24H: Double
    let percentChange7D: Double
    let marketCap: Double
    let lastUpdated: String
}
