import SwiftUI
import Resolver

extension SearchView {
    class ViewModel: SearchBar {
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

        func change(_ currency: Cryptocurrency) -> Double {
            let range = state.range!
            let quote = currency.quote.first!

            switch range {
            case "1h":
                return quote.value.percentChange1H
            case "24h":
                return quote.value.percentChange24H
            case "7d":
                return quote.value.percentChange7D
            default:
                fatalError()
            }
        }

        func positive(_ currency: Cryptocurrency) -> Bool {
            change(currency) >= 0
        }

        func difference(_ currency: Cryptocurrency) -> String {
            "\(String(format: "%.2f", change(currency)))%"
        }
    }
}
