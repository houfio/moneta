import Foundation
import Resolver

class StateService: ObservableObject {
    @Published var currency = UserDefaults.standard.integer(forKey: "currency") {
        didSet {
            UserDefaults.standard.set(currency, forKey: "currency")
        }
    }

    @Published var range = UserDefaults.standard.string(forKey: "range") {
        didSet {
            UserDefaults.standard.set(range, forKey: "range")
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
        currencies = Bundle.main.decode("fiat.json")
        cryptocurrencies = Bundle.main.decode("listings.json")

        if currency == 0 {
            currency = currencies.data.first { currency in
                currency.symbol == "EUR"
            }!.id
        }

        if range == nil {
            range = "24h"
        }
    }
}
