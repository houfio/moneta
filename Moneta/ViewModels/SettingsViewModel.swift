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
    var assets: Assets
    
    init() {
        self.exchanges = Bundle.main.decode("exchanges.json", type: Exchanges.self)
        self.assets = Bundle.main.decode("assets.json", type: Assets.self)
        
        if self.exchange == nil {
            self.exchange = "kraken"
        }
        
        if self.currency == nil {
            self.currency = "eur"
        }
    }
    
    func activeExchanges() -> [Exchange] {
        self.exchanges.result.filter { exchange in
            exchange.active
        }.sorted { a, b in
            a.symbol < b.symbol
        }
    }
    
    func currentExchange() -> Exchange? {
        self.activeExchanges().first { exchange in
            exchange.symbol == self.exchange
        }
    }
    
    func fiatCurrencies() -> [Asset] {
        self.assets.result.filter { asset in
            asset.fiat
        }.sorted { a, b in
            a.symbol < b.symbol
        }
    }
    
    func currentCurrency() -> Asset? {
        self.fiatCurrencies().first { asset in
            asset.symbol == self.currency
        }
    }
}
