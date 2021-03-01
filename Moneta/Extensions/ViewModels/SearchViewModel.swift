import SwiftUI

extension SearchView {
    class ViewModel: SearchBar {
        func currencies(data: DataService) -> [Cryptocurrency] {
            guard let cryptocurrencies = data.cryptocurrencies else {
                fatalError()
            }

            return cryptocurrencies.data.filter { currency in
                isSearched(currency)
            }
        }

        func isSearched(_ currency: Cryptocurrency) -> Bool {
            if text.isEmpty {
                return true
            }

            return currency.name.localizedCaseInsensitiveContains(text) || currency.symbol.localizedCaseInsensitiveContains(text)
        }

        func change(_ currency: Cryptocurrency, state: StateService) -> Double {
            let quote = currency.quote.first!

            switch state.range {
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
    }
}
