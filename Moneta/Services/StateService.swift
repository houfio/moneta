import Foundation
import Resolver

class StateService {
    @Published var currency = UserDefaults.standard.integer(forKey: "currency") {
        didSet {
            UserDefaults.standard.set(currency, forKey: "currency")
        }
    }

    @Published var showAmounts = UserDefaults.standard.bool(forKey: "showAmounts") {
        didSet {
            UserDefaults.standard.set(showAmounts, forKey: "showAmounts")
        }
    }

    var currencies: Currencies
    var cryptocurrencies: Cryptocurrencies

    init() {
        currencies = Bundle.main.decode("fiat.json", type: Currencies.self)
        cryptocurrencies = Bundle.main.decode("listings.json", type: Cryptocurrencies.self)

        if currency == 0 {
            currency = currencies.data.first { currency in
                currency.symbol == "EUR"
            }!.id
        }
    }
}
