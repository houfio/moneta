import SwiftUI

extension SettingsView {
    class ViewModel: ObservableObject {
        @Published var showCurrencies = false
        @Published var showRanges = false
        @Published var showCoins = false

        let ranges = ["1h", "24h", "7d"]

        func currentCurrency(data: DataService, state: StateService) -> Currency? {
            data.currencies?.data.first { currency in
                isCurrentCurrency(currency, state: state)
            }
        }

        func isCurrentCurrency(_ currency: Currency, state: StateService) -> Bool {
            currency.symbol == state.currency
        }

        func updateCurrency(_ currency: Currency, data: DataService, state: StateService) {
            state.currency = currency.symbol
            data.fetchListings(state: state)
            showCurrencies = false
        }
    }
}
