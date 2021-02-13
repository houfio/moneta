import Foundation

extension Bundle {
    func decode<T: Decodable>(_ file: String, type: T.Type) -> T {
        let decoder = JSONDecoder()
        let url = self.url(forResource: file, withExtension: nil)!
        let data = try! Data(contentsOf: url)
        let result = try! decoder.decode(type, from: data)
        
        return result
    }
}
