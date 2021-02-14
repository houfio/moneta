import Foundation

struct Status: Codable {
    var timestamp: String
    var errorCode: Int
    var errorMessage: String?
    var elapsed: Int
    var creditCount: Int
}
