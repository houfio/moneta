import SwiftUI
import Resolver

class SearchViewModel: SearchBar {
    @Injected private var state: StateService

    func currencies() -> [Cryptocurrency] {
        state.cryptocurrencies.data.filter { currency in
            isSearched(currency)
        }
    }

    func isSearched(_ currency: Cryptocurrency) -> Bool {
        if text.isEmpty {
            return true
        }

        return currency.name.localizedCaseInsensitiveContains(text) || currency.symbol.localizedCaseInsensitiveContains(text)
    }
}
