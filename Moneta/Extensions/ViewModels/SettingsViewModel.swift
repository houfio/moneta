import SwiftUI

extension SettingsView {
    class ViewModel: ObservableObject {
        @Published var showCurrencies = false
        @Published var showRanges = false
        @Published var showCoins = false

        let ranges = ["1h", "24h", "7d"]

        func currentCurrency(data: DataService, state: StateService) -> Currency {
            guard let currencies = data.currencies else {
                fatalError()
            }

            return currencies.data.first { currency in
                isCurrentCurrency(currency, state: state)
            }!
        }

        func isCurrentCurrency(_ currency: Currency, state: StateService) -> Bool {
            currency.symbol == state.currency
        }
    }
}
