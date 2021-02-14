import SwiftUI
import Resolver

class SearchViewModel: SearchBar {
    @Injected private var state: StateService

    func currencies() -> [Asset] {
        state.assets.result.filter { currency in
            !currency.fiat
        }.sorted { a, b in
            a.symbol < b.symbol
        }
    }
}
