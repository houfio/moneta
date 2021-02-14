import SwiftUI
import Resolver

extension SettingsView {
    class ViewModel: ObservableObject {
        @Injected var state: StateService

        @Published var showCurrencies = false
        @Published var showRanges = false
        @Published var showCoins = false

        func currentCurrency() -> Currency? {
            state.currencies.data.first { currency in
                isCurrentCurrency(currency)
            }
        }

        func isCurrentCurrency(_ currency: Currency) -> Bool {
            currency.id == state.currency
        }
    }
}
