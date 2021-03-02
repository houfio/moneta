import Foundation

class StateService: ObservableObject {
    @Published var currency = UserDefaults.standard.string(forKey: "currency") ?? "EUR" {
        didSet {
            UserDefaults.standard.set(currency, forKey: "currency")
        }
    }

    @Published var range = UserDefaults.standard.string(forKey: "range") ?? "24h" {
        didSet {
            UserDefaults.standard.set(range, forKey: "range")
        }
    }

    @Published var showAmounts = UserDefaults.standard.bool(forKey: "showAmounts") {
        didSet {
            UserDefaults.standard.set(showAmounts, forKey: "showAmounts")
        }
    }

    @Published var portfolio = UserDefaults.standard.object(forKey: "portfolio") as? [String: String] ?? [:] {
        didSet {
            UserDefaults.standard.set(portfolio, forKey: "portfolio")
        }
    }
}
