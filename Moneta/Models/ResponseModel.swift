import Foundation

struct Response<T: Codable>: Codable {
    let data: [T]
    let status: Status
}

struct Status: Codable {
    var timestamp: String
    var errorCode: Int
    var errorMessage: String?
    var elapsed: Int
    var creditCount: Int
}
