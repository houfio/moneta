import Foundation
import Combine

class SettingsViewModel: ObservableObject {
    @Published var exchange = UserDefaults.standard.string(forKey: "exchange") {
        didSet {
            UserDefaults.standard.set(self.exchange, forKey: "exchange")
        }
    }
    
    @Published var currency = UserDefaults.standard.string(forKey: "currency") {
        didSet {
            UserDefaults.standard.set(self.currency, forKey: "currency")
        }
    }
    
    @Published var showAmounts = UserDefaults.standard.bool(forKey: "showAmounts") {
        didSet {
            UserDefaults.standard.set(self.showAmounts, forKey: "showAmounts")
        }
    }
    
    @Published var showExchanges = false
    @Published var showCurrencies = false
    @Published var showCoins = false
    
    var exchanges: Exchanges
    var pairs: Pairs
    
    init() {
        self.exchanges = SettingsViewModel.decode(file: "exchanges.json", type: Exchanges.self)
        self.pairs = SettingsViewModel.decode(file: "pairs.json", type: Pairs.self)
        
        if self.exchange == nil {
            self.exchange = "kraken"
        }
        
        if self.currency == nil {
            self.currency = "eur"
        }
    }
    
    private static func decode<T: Decodable>(file: String, type: T.Type) -> T {
        let decoder = JSONDecoder()
        let url = Bundle.main.url(forResource: file, withExtension: nil)!
        let data = try! Data(contentsOf: url)
        let result = try! decoder.decode(type, from: data)
        
        return result
    }
    
    func activeExchanges() -> [Exchange] {
        self.exchanges.result.filter { exchange in
            exchange.active
        }.sorted {
            $0.symbol < $1.symbol
        }
    }
    
    func currentExchange() -> Exchange? {
        self.activeExchanges().first { exchange in
            exchange.symbol == self.exchange
        }
    }
    
    func currencies() -> [String] {
        let currencies = self.pairs.result.filter { pair in
            pair.base.fiat
        }.map { pair in
            pair.base.symbol
        }
        
        return Array(Set(currencies)).sorted()
    }
}
