import Foundation

extension Bundle {
    func decode<T: Decodable>(_ file: String) -> T {
        let decoder = JSONDecoder()

        decoder.keyDecodingStrategy = .convertFromSnakeCase

        let url = self.url(forResource: file, withExtension: nil)!
        let data = try! Data(contentsOf: url)
        let result = try! decoder.decode(T.self, from: data)

        return result
    }
}
