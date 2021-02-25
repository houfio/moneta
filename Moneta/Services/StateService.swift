import Foundation

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

    func initialize(data: DataService) {
        if currency == 0 {
            currency = data.currencies.data.first { currency in
                currency.symbol == "EUR"
            }!.id
        }

        if range == nil {
            range = "24h"
        }
    }
}
