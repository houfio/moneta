import SwiftUI
import Resolver

class SearchViewModel: SearchBar {
    @Injected private var state: StateService

    func currencies() -> [Asset] {
        state.assets.result.filter { currency in
            !currency.fiat && isSearched(currency)
        }.sorted { a, b in
            a.symbol < b.symbol
        }
    }

    func isSearched(_ currency: Asset) -> Bool {
        if text.isEmpty {
            return true
        }

        return currency.name.localizedCaseInsensitiveContains(text) || currency.symbol.localizedCaseInsensitiveContains(text)
    }
}
