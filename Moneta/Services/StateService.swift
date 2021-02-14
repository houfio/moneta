import Foundation
import Resolver

class StateService {
    @Published var exchange = UserDefaults.standard.string(forKey: "exchange") {
        didSet {
            UserDefaults.standard.set(exchange, forKey: "exchange")
        }
    }

    @Published var currency = UserDefaults.standard.string(forKey: "currency") {
        didSet {
            UserDefaults.standard.set(currency, forKey: "currency")
        }
    }

    @Published var showAmounts = UserDefaults.standard.bool(forKey: "showAmounts") {
        didSet {
            UserDefaults.standard.set(showAmounts, forKey: "showAmounts")
        }
    }

    var exchanges: Exchanges
    var assets: Assets

    init() {
        exchanges = Bundle.main.decode("exchanges.json", type: Exchanges.self)
        assets = Bundle.main.decode("assets.json", type: Assets.self)

        if exchange == nil {
            exchange = "kraken"
        }

        if currency == nil {
            currency = "eur"
        }
    }
}
